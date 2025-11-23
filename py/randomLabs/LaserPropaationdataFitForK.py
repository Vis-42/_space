import numpy as np
import matplotlib.pyplot as plt
from scipy.stats import linregress
from scipy.optimize import curve_fit

def model_func(x, W0):
    Zr = (3.141592 * W0**2) / (632.8 * 1e-9)
    return W0**2 * (1 + (x) / Zr**2)

# Your data
distance = np.array([18, 16, 14, 12, 10, 7, 5, 2, 1, 0.9, 0.77, 0.65, 0.5, 0.1])
k_values = np.array([88.87268051915262, 71.08239808542609, 52.7880987282305, 37.97397686815307, 
                     26.38129383531709, 14.296636698232993, 7.337986040558462, 1.2927752400188013, 
                     0.4552, 0.3736632387158469, 0.31908, 0.28439986827517094, 
                     0.23657113247411274, 0.19252311401052444])
k_error = np.array([0.5436507282569012, 0.7125677501201377, 0.48142656314903326, 0.1675035998318414, 
                    0.15736249337761266, 0.3494479003671817, 0.1650388731983043, 0.018543760015211012, 
                    0.009151212472238594, 0.01035743411433301, 0.007051158105456104, 0.005490914687892267, 
                    0.006061025084573732, 0.005190621361794928, 0.007547749935677494, 0.00599659065926215, 
                    0.014406073895532811])

# Select the relevant data points
distance = distance[9:14]
k_values = k_values[9:14]
k_error = k_error[9:14]

# Compute r^2 (distance^2) and k^2 (k_values^2) 
x = distance**2
y = k_values*1e-6

# Perform linear regression (y = a + b * x)
slope, intercept, r_value, p_value, std_err = linregress(x, y)

# Calculate the standard error of the intercept
n = len(x)  # number of data points
intercept_error = std_err * (1/n + (x.mean()**2 / ((x - x.mean())**2).sum()))**0.5

print("Slope:", slope, "±", std_err)
print("Intercept:", intercept, "±", intercept_error)

# Plot the data points with error bars
plt.errorbar(x, y, fmt='o', label='Experimental Points', color='blue', capsize=3)

# Generate x values for the fitted line
x_fit = np.linspace(min(x), max(x), 100)
y_fit = intercept + slope * x_fit

# Plot the linear regression line
plt.plot(x_fit, y_fit, 'g-', label='Linear Fit')

# Curve fitting using model_func
initial_guess = [0.0004355403487738414]  # Initial guess for fitting parameters
params, covariance = curve_fit(model_func, x, y, p0=initial_guess)
W0 = params[0]  # Extract fitted parameter W0

print(W0**2)

# Plot the fitted curve from the model function
y_fit_model = model_func(x_fit, W0)
plt.plot(x_fit, y_fit_model, 'r-', label=f'Model Fit: W0 = {W0:.4f}')

plt.xlabel('r[m]', fontsize=15)
plt.ylabel('W[mm]', fontsize=15)
plt.legend()
plt.grid(True)

# Show the plot
plt.show()
