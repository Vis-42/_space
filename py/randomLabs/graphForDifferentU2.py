import pandas as pd
import matplotlib.pyplot as plt

file_path = "C:/physicsLabs/FrankHertz/NeonDATA.xlsx"   # Replace with your actual file path
excel_file = pd.ExcelFile(file_path)

# Get the sheet names
sheet_names = excel_file.sheet_names

# Load data from the specified sheets
x = [pd.read_excel(file_path, sheet_name=sheet_names[i], skiprows=1).iloc[::, 0] for i in range(0, 10)]
y = [pd.read_excel(file_path, sheet_name=sheet_names[i], skiprows=1).iloc[::, 1] for i in range(0, 10)]

for i in [0,1,2,7,9]:
    print(sheet_names[i] )
# Plot each line with a label corresponding to the sheet name
plt.plot(x[0], y[0], color='#1f77b4', label="U2 = 4V")
plt.plot(x[1], y[1], color='#ff7f0e', label="U3 = 7V")
plt.plot(x[2], y[2], color='#2ca02c', label="U3 = 9V")
plt.plot(x[7], y[7], color='#9467bd', label="U3 = 10V")
plt.plot(x[9], y[9], color='#d62728', label="U3 = 12V")
# Add labels for the axes
plt.xlabel("U1/V")
plt.ylabel("IA/nA")

# Add a legend to the plot
plt.legend()

# Show the plot
plt.show()
