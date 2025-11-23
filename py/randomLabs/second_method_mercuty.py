import json
import matplotlib.pyplot as plt

# Read the JSON file line by line
with open("data_neon.json", "r") as file:
    datasets = []
    for line in file:
        if line.strip():  # Ensure it's not a blank line
            datasets.append(json.loads(line))

# Loop over each dataset and plot the differences
for dataset in datasets:
    peaks = dataset['peaks']
    sheet_name = dataset['sheet_name']
    
    # Calculate differences between consecutive peaks
    differences = [peaks[i+1] - peaks[i] for i in range(len(peaks) - 1)]
    
    # Plot the results
    plt.figure()
    plt.plot(range(1, len(differences) + 1), differences, marker='o')
    plt.xlabel('n')
    plt.ylabel('Next_peak - Previous_peak')
    plt.title(f'Peak Differences for {sheet_name}')
    plt.grid(True)
    plt.show()
