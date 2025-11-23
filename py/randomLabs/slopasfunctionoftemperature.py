import matplotlib.pyplot as plt
import numpy as np

# Data
temperature = [170, 180, 190, 200]
slope = [0.072, 0.054, 0.05, 0.032]
error = [0.038, 0.023, 0.027, 0.024]

# Convert slope and temperature to their natural logarithms
ln_slope = np.log(slope)
ln_temp = np.log(temperature)

# Perform linear fit (polyfit returns the slope and intercept)
fit_coeff = np.polyfit(ln_temp, ln_slope, 1)
fit_slope = fit_coeff[0]
fit_intercept = fit_coeff[1]

# Print the slope of the linear fit
print(f"Slope of the linear fit: {fit_slope}")

# Generate fitted line for plotting
fit_line = np.polyval(fit_coeff, ln_temp)

# Plotting with error bars and caps at the ends
plt.errorbar(temperature, slope, yerr=error, fmt='o', color='b', capsize=5, label='Data with error')

# Labels and title
plt.xlabel('Temperature (°C)')
plt.ylabel('Slope')
plt.title('Slope vs Temperature ')

# Add legend
plt.legend()

# Display the plot
plt.grid(True)
plt.show()
