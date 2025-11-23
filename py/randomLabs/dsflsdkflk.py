
import matplotlib.pyplot as plt
import numpy as np
from scipy.optimize import curve_fit

# Data for peaks and errors
peaks = [ 33.3, 38.1, 43.1, 48.1, 53.16]
error = [0.1, 0.1, 0.2, ]

peaks = [23.3, 28.0, 32.8, 37.7, 42.7, 47.7, 52.8, 57.9]

delta = []
errors_delta = []

# Calculate delta and errors_delta
for i in range(0, len(peaks) - 1):
    delta.append(peaks[i+1] - peaks[i])
    errors_delta.append(0.2)

# Peak numbers
delta_numbers = np.arange(3, len(delta) + 3)

# Define a linear model for fitting
def linear_model(x, m, c):
    return m * x + c

# Perform linear fitting
popt, pcov = curve_fit(linear_model, delta_numbers, delta)

# Extract slope and intercept from fitting results
slope, intercept = popt

# Extract slope error and intercept error from the covariance matrix
slope_error = np.sqrt(pcov[0, 0])
intercept_error = np.sqrt(pcov[1, 1])

# Print the slope, intercept, and their errors
print(f"Slope: {slope:.6f} ± {slope_error:.6f}")
print(f"Intercept: {intercept:.6f} ± {intercept_error:.6f}")

# Generate model line for the plot
fitted_delta = linear_model(delta_numbers, slope, intercept)

# Plotting the graph with error bars
plt.errorbar(delta_numbers, delta, yerr=errors_delta, fmt='o', capsize=5, label="Delta with errors")
plt.plot(delta_numbers, fitted_delta, label=f"Fitted Line (y={slope:.2f}x + {intercept:.2f})", color='red')

# Labeling the axes
plt.xlabel('Delta Number')
plt.ylabel('Delta Value')

# Adding a title
plt.title('Delta Values with Fitted Line')

# Displaying the plot
plt.legend()
plt.grid(True)
plt.show()
