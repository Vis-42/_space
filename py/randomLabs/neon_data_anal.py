import pandas as pd
import matplotlib.pyplot as plt
import threading
import queue
from scipy import stats
import numpy as np
import json
from scipy.optimize import curve_fit

def linear_model(x, a, b):
    return a * x + b

# Function to collect user input in a separate thread
def collect_peaks_and_errors(q):
    while True:
        try:
            peak_input = input("Input peak (or type 'done' to finish): ")
            if peak_input.lower() == 'done':
                q.put((None, None))  # Sentinel value to signal end of input
                break
            peak = float(peak_input)
            
            error_input = input("Input error for this peak: ")
            error = float(error_input)

            q.put((peak, error))
        except ValueError:
            print("Invalid input. Please enter numerical values for the peak and error or 'done' to finish.")

# Load the Excel file
file_path = "C:/physicsLabs/FrankHertz/UH 6 T 170.xlsx"   # Replace with your actual file path
excel_file = pd.ExcelFile(file_path)

# Get the sheet names
sheet_names = excel_file.sheet_names
numberOfSheets = 18

# Create a queue for thread-safe communication
peak_queue = queue.Queue()

for sheet_number in range(0, numberOfSheets):
    sheet_name = sheet_names[sheet_number]  # Get the name of the sheet

    # Load data from the specified sheet
    data = pd.read_excel(file_path, sheet_name=sheet_name, skiprows=1)

    # Extract data from the first and second columns
    x = data.iloc[::, 0]  
    y = data.iloc[::, 1]  

    # Enable interactive mode
    plt.ion()

    # Plot the data
    fig, ax = plt.subplots()
    ax.plot(x, y)
    ax.set_xlabel('X-axis label')  # Replace with your X-axis label
    ax.set_ylabel('Y-axis label')  # Replace with your Y-axis label
    ax.set_title(f'Data from Sheet: {sheet_name}')  # Use the sheet name as the title

    # Start the input collection thread
    input_thread = threading.Thread(target=collect_peaks_and_errors, args=(peak_queue,))
    input_thread.daemon = True
    input_thread.start()

    # Display the plot
    plt.show()

    # Collect peaks and errors from the queue
    peakArray = []
    errorArray = []
    while True:
        try:
            # Non-blocking check for new peaks and errors
            peak, error = peak_queue.get_nowait()
            if peak is None:  # Sentinel value to break the loop
                break
            peakArray.append(peak)
            errorArray.append(error)
            print(f"Current peaks: {peakArray}")
            print(f"Current errors: {errorArray}")
        except queue.Empty:
            pass

        # To keep the plot responsive
        plt.pause(1)  # Pause to update the plot

    # Close the old plot
    plt.close(fig)

    # Perform linear regression using scipy with errors
    if len(peakArray) > 1:  # Ensure there are enough peaks for regression
        X = np.arange(len(peakArray))  # Indices of peaks as X
        y_peaks = np.array(peakArray)  # Peak values as Y
        y_err = np.array(errorArray)   # Error values for Y

        # Perform weighted linear regression considering the errors
        popt, pcov = curve_fit(linear_model, X, y_peaks, sigma=y_err, absolute_sigma=True)
        slope, intercept = popt
        slope_err, intercept_err = np.sqrt(np.diag(pcov))

        print(f"Slope: {slope:.4f}")
        print(f"Standard Error of Slope: {slope_err:.4f}")

        # Save the data in a JSON file, including the sheet name
        data = {
            "sheet_name": sheet_name,
            "peaks": peakArray,
            "errors": errorArray,
            "slope": slope,
            "slope_error": slope_err
        }

        with open("data_mercury.json", "a") as json_file:
            json.dump(data, json_file)
            json_file.write("\n")  # Write a newline character to separate entries

    else:
        print(f"Not enough data points to perform linear regression for sheet: {sheet_name}.")
