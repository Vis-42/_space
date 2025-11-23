import matplotlib.pyplot as plt
import numpy as np
from scipy.optimize import curve_fit

# Data for peaks and errors
peaks = [23.4, 40.2, 57.5, 74.9, 93]
errors = [0.5, 0.3, 0.2, 0.4, 0.2]

# mercury 170 3V
peaks = [18.53, 23.32,28.32, 33.52, 38.6, 43.71]
errors = [0.2,0.2,0.2, 0.2,0.1, 0.2]
start_peak = 3

# mercury 180 3V
peaks = [23.32, 28.3, 33.24, 38.29, 43.28, 48.57, 53.73]
errors = [0.1,0.1,0.1, 0.1,0.1, 0.1, 0.1]
start_peak = 4

# # mercury 190 
# peaks = [23.75, 28.53, 33.33, 38.31, 43.07, 48.15, 53.16]
# errors = [0.1,0.1,0.1, 0.1,0.1, 0.1, 0.1]
# start_peak = 4

# # mercury 200
# peaks = [ 38.75, 43.57, 48.42, 53.29, 58.21]
# errors =  [0.1,0.1,0.1,0.1,0.1,0.1]
# start_peak = 7

delta = []
errors_delta = []

# Calculate delta and errors_delta
for i in range(0, len(peaks) - 1):
    delta.append(peaks[i+1] - peaks[i])
    errors_delta.append(errors[i+1]+errors[i])
    
print(delta)
# Peak numbers
delta_numbers = np.arange(start_peak-1, len(delta) + start_peak-1)

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
plt.errorbar(delta_numbers, delta, yerr=errors_delta, fmt='o', capsize=5, label="Min peaks")
plt.plot(delta_numbers, fitted_delta, label=f"Fitted Line ", color='red')

# Labeling the axes
plt.xlabel('Order of Minima')
plt.ylabel('Minima Spasing deltaU[V]')


# Displaying the plot
plt.legend()
plt.grid(True)
plt.show()
