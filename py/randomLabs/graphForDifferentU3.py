import pandas as pd
import matplotlib.pyplot as plt

file_path = "C:/physicsLabs/FrankHertz/NeonDATA.xlsx"   # Replace with your actual file path
excel_file = pd.ExcelFile(file_path)

# Get the sheet names
sheet_names = excel_file.sheet_names

# Load data from the specified sheets
x = [pd.read_excel(file_path, sheet_name=sheet_names[i], skiprows=1).iloc[::, 0] for i in range(3, 7)]
y = [pd.read_excel(file_path, sheet_name=sheet_names[i], skiprows=1).iloc[::, 1] for i in range(3, 7)]

# Plot each line with a label corresponding to the sheet name
plt.plot(x[0], y[0], color='b', label="U3 = 2V")
plt.plot(x[1], y[1], color='#FFA500', label="U3 = 3.5V")
plt.plot(x[2], y[2], color='g', label="U3 = 4V")
plt.plot(x[3], y[3], color='r', label="U3 = 5V")

# Add labels for the axes
plt.xlabel("U1/V")
plt.ylabel("IA/nA")

# Add a legend to the plot
plt.legend()

# Show the plot
plt.show()
