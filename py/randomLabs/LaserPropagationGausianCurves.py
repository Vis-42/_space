import numpy as np
import matplotlib.pyplot as plt
from scipy.optimize import curve_fit


def model_func(x, A, x0, k):
    return A * np.exp(-2*(x - x0)**2 / k)


def delete_value(arr1, arr2, value):
    for i in range(0, len(arr1)):
        if(value == arr1[i]):
            
            return np.delete(arr1, i), np.delete(arr2, i)

def func(X_data, Y_data, names, start_index, end_index):
    colors = ['#FF1919', '#FFC71B', '#A4D86E', '#00B050', '#00B0F0', '#0070C0', '#002060']

    # Loop through the specified index range
    for i in range(start_index, end_index):
        x = X_data[i]
        y = Y_data[i]
        if i==10: y = np.array(y)*1.2
        if i==11: y = np.array(y)*0.95
        if i==12: y = np.array(y)*0.9
        if i==13: y = np.array(y)*0.8
        if i==14: y = np.array(y)*0.6
        if i==5: y= np.array(y)*0.8
        if i==4: y= np.array(y)*1.4
        if i==3: y= np.array(y)*2
        if i==2: y= np.array(y)*2.8
        if i==6: y= np.array(y)*0.45
        name = names[i]

        initial_guess = [4, 0, 1]  # Initial guess for fitting parameters

        params, covariance_matrix = curve_fit(model_func, x, y, p0=initial_guess)
        A, x0, k = params  # Extract fitted parameters
        

        # The standard deviation errors are the square root of the diagonal elements of the covariance matrix
        errors = np.sqrt(np.diag(covariance_matrix))
        A_err, x0_err, k_err = errors  # Extract errors for A, x0, and k
        print(f"Fitted parameters for {name}: A = {A}, x0 = {x0}, k = {k} +- {k_err}")

        

        # Generate fitted data
        x_fit = np.linspace(min(x - x0), max(x - x0), 100)
        y_fit = model_func(x_fit, A, 0, k)

        # Plot original data
        plt.plot(x - x0, y, marker='o', linestyle='None', color=colors[(i - start_index) % len(colors)])

        # Plot fitted curve
        plt.plot(x_fit, y_fit, color=colors[(i - start_index) % len(colors)], label=f'{name}')


X_data = []
Y_data = []
name = []

#without polorizer
x = array = np.arange(-5, 4.5, 0.5)
y = [0.06, 0.17, 0.48, 1.11, 2.19, 3.63, 5.35, 6.88, 7.75, 7.87, 7.1, 5.7, 4.4, 2.5, 1.36, 0.65, 0.25, 0.08, 0.0]

X_data.append(x)
Y_data.append(y)
name.append("without polorizer")

#with polorizer
x = array = np.arange(-5.5, 4.5, 0.5)
y = [0.01, 0.04, 0.13, 0.37, 0.83, 1.67, 2.8, 4.05, 5.2, 6, 6.06, 5.45, 4.39, 3.15, 1.93, 1.05, 0.49, 0.19, 0.07, 0.02]

X_data.append(x)
Y_data.append(y)
name.append("with polorizer")

#18m
x = np.arange(-6,7, 1)
y = [0.394, 0.51, 0.631, 0.727, 0.828, 0.884, 0.909, 0.892, 0.837,0.752, 0.642, 0.525, 0.414]
X_data.append(x)
Y_data.append(y)
name.append("18m")

#16m
x = np.arange(-6,7, 1)
y = [0.392, 0.55, 0.736, 0.872, 1.01, 1.114, 1.150, 1.124, 1.037, 0.912, 0.751, 0.586, 0.434]
X_data.append(x)
Y_data.append(y)
name.append("16m")

#14m
x = np.arange(-5,6, 1)
y = [0.55, 0.78, 1, 1.22, 1.37, 1.43, 1.385, 1.24, 1.02,0.8, 0.55]
X_data.append(x)
Y_data.append(y)
name.append("14m")

#12m

x = np.arange(-5.5,6, 0.5)
y = [0.37, 0.5, 0.66, 0.83, 1.03, 1.22, 1.42, 1.59, 1.76, 1.88, 1.95, 1.985, 1.97, 1.90, 1.8, 1.645, 1.47, 1.28, 1.08, 0.89, 0.71, 0.55, 0.42]
X_data.append(x)
Y_data.append(y)
name.append("12m")

#10m
x = array = np.arange(-5, 5.5, 0.5)
y = [0.41, 0.60, 0.844, 1.08, 1.421, 1.75, 2.05, 2.31, 2.50, 2.62, 2.650,  2.574, 2.414, 2.180, 1.900, 1.600, 1.291, 1.003, 0.744, 0.525, 0.36]

X_data.append(x)
Y_data.append(y)
name.append("10m")

#7m
x = array = np.arange(-4, 4.5, 0.5)
y = [0.542, 0.999, 1.655, 2.523, 3.477, 4.00, 4.75, 5.18, 5.27, 4.98, 4.33, 3.87, 2.897, 2.015, 1.275, 0.74, 0.383]

X_data.append(x)
Y_data.append(y)
name.append("7m")

#5m
x = array = np.arange(-3, 3.5, 0.5)
y = [0.368, 0.819, 1.655, 2.884, 3.90, 4.98, 5.43, 5.13, 4.19, 3.304, 1.999, 1.04, 0.440]

X_data.append(x)
Y_data.append(y)
name.append("5m")


#2m
x = array = np.arange(-1.4, 1.6, 0.2)
y = [0.382, 0.685, 1.331, 2.40, 3.875, 5.05, 6.29, 6.88, 6.54, 5.406, 4.00, 2.76, 1.52, 0.718, 0.397]

X_data.append(x)
Y_data.append(y)
name.append("2m")



#1m
x = array = np.arange(-0.8, 0.9, 0.1)
y = [0.429, 0.801, 1.286, 1.997, 2.945, 3.82, 4.93, 5.74, 6.15, 5.95, 5.18, 4.08, 3.15, 2.128, 1.200, 0.679, 0.383 ]

x = np.arange(-0.6,0.7,0.1)
y = [0.982, 1.570, 2.473, 3.532, 4.44, 5.51, 6, 5.77, 4.98, 3.87, 2.735, 1.689, 0.845]

X_data.append(x)
Y_data.append(y)
name.append("1m")

#0.90
x = np.arange(-0.8, 0.6 ,0.1)
y = [0.616, 1.09, 1.790, 2.710, 3.75, 4.58, 5.49, 5.83, 5.42, 4.35, 3.27, 2.14, 1.24, 0.61]

# X_data.append(x)
# Y_data.append(y)
# name.append("0.9m")

#0.77

x = np.arange(-0.65,0.65 ,0.1)
y = [0.495, 1.095, 1.96, 3.09, 4.42, 5.77, 6.4, 5.89, 4.5, 3.14, 1.72, 0.89, 0.50]


X_data.append(x)
Y_data.append(y)
name.append("0.77m")

#65cm

x= np.arange(-0.6, 0.55, 0.05)
y = [0.573, 0.772, 1.089, 1.490, 1.925, 2.468, 2.900, 3.423, 3.870, 3.84, 4.04, 4.08, 3.94, 3.70, 3.54, 3.03, 2.52, 1.98, 1.55, 1.12, 0.840, 0.61, 0.45 ]


# X_data.append(x)
# Y_data.append(y)
# name.append("0.65m")

#0.5m
x = array = np.arange(-0.6, 0.6, 0.1)
y = [0.413, 0.731, 1.555, 2.878, 4.03, 4.98, 5.31, 4.83, 3.61, 2.33, 1.069, 0.420]
X_data.append(x)
Y_data.append(y)
name.append("0.5m")


#0.185m
x = array = np.arange(-0.5, 0.55, 0.05)
y = [0.393, 0.621, 1.029, 1.738, 2.460, 2.882, 3.492, 3.93, 4.37, 4.55, 4.68, 4.50, 3.83, 3.375, 2.733,2.262, 1.727, 1.197, 0.869, 0.626, 0.380]
X_data.append(x)
Y_data.append(y)
name.append("0.185m")


#0.1
x = array = np.arange(-0.5, 0.5, 0.05)
y = [0.375, 0.585, 0.970, 1.358, 1.568, 2.144, 2.945, 3.736, 4.14, 4.28, 4.29, 3.98, 3.68, 3.377, 2.490, 1.950, 1.585, 1.387, 0.915, 0.522]
X_data.append(x)
Y_data.append(y)
name.append("0.1m")

#0.1
x = array = np.arange(-0.4, 0.6, 0.05)
y = [0.65, 1.137, 1.728, 2.534, 3.176, 3.477, 4.53, 5.63, 6.43, 6.14, 5.99, 5.75, 5.3, 4.65, 3.56, 2.858, 2.186, 1.71, 1.15, 0.692]

y,x = delete_value(y,x, 6.43)

X_data.append(x)
Y_data.append(y)    
name.append("0.1m")


#0.1
x = array = np.arange(-0.45, 0.45, 0.05)
y = [0.99, 1.461, 1.515,1.67, 2.282, 3.395, 3.646, 3.7, 3.92, 4.11, 3.784, 3.201, 3.141, 2.722, 2.105, 1.818, 1.275, 0.760 ]


X_data.append(x)
Y_data.append(y)    
name.append("0.1m")




func(X_data, Y_data, name, 2, 7)

# Final plot adjustments
plt.xlabel('r[mm]', fontsize=15)
plt.ylabel('Intensity[V]', fontsize=15)
plt.legend()
plt.grid(True)

# Show plot
plt.show()

