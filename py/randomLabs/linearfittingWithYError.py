import numpy as np
import matplotlib.pyplot as plt
from scipy.optimize import curve_fit

# Provided data
x = np.array([23, 25, 27, 30, 33, 35, 40, 45, 50, 55, 60, 65, 37, 43, 48, 53, 57, 63, 75, 70])
y = np.array([0.211, 0.226, 0.246, 0.277, 0.303, 0.32, 0.363, 0.416, 0.458, 0.51, 0.547, 0.602, 0.345, 0.397, 0.446, 0.486, 0.525, 0.578, 0.688, 0.643])

y = y*4.262761
y_err = np.full_like(y, 0.01*4.262761)  # y errors set to 0.01 for all points

# Define a linear function
def linear_model(x, a, b):
    return a * x + b

# Perform the linear fit
popt, pcov = curve_fit(linear_model, x, y, sigma=y_err, absolute_sigma=True)

# Extract fit parameters and their errors
slope, intercept = popt
slope_err, intercept_err = np.sqrt(np.diag(pcov))
print(slope_err/slope)
print(slope)
print(intercept)

# Plotting the data with error bars and the fit
plt.errorbar(x, y, yerr=y_err, fmt='o', label='Data', capsize=5)
plt.plot(x, linear_model(x, *popt), 'r-', label=f'Fit: y = 3.92e-05*x -4.4e-06')
# plt.fill_between(x, linear_model(x, slope + slope_err, intercept + intercept_err),
#                  linear_model(x, slope - slope_err, intercept - intercept_err), color='red', alpha=0.2, label='Fit uncertainty')
plt.xlabel('Frequency, MHz')
plt.ylabel('Magnetic field, mT')
plt.legend()
plt.show()
