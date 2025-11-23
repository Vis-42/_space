import pandas as pd
import matplotlib.pyplot as plt

# Load the Excel file
file_path = "C:/physicsLabs/FrankHertz/UH 7 T 200.xlsx"  # Replace with your actual file path
excel_file = pd.ExcelFile(file_path)

# Get the sheet names
sheet_names = excel_file.sheet_names
numberOfSheets = len(sheet_names)

namesArray = ["U3 = 2V", "U3 = 3V", "U3 = 4V", "U3 = 5V"]
for sheet_number in range(0,4 ):
    sheet_name = sheet_names[sheet_number]  # Get the name of the sheet

    # Load data from the specified sheet
    data = pd.read_excel(file_path, sheet_name=sheet_name, skiprows=1)

    # Extract data from the first and second columns
    x = data.iloc[:, 0]  # First column (independent variable)
    y = data.iloc[:, 1]  # Second column (dependent variable)

    # Plot the data with proper labeling
    plt.plot(x, y, label=namesArray[sheet_number])

plt.xlabel("Voltage U1[V]", fontsize=14)
plt.ylabel("Current Ia[nA]", fontsize=14)
plt.title("U2 = 10V", fontsize=14)
# Show the legend and the plot
plt.legend()
plt.show()
