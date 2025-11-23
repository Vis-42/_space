import numpy as np
import matplotlib.pyplot as plt
from scipy.optimize import curve_fit
from scipy import stats
import warnings
warnings.filterwarnings('ignore')

# Global plotting style: 400 dpi, 14pt fonts
plt.style.use('seaborn-v0_8-darkgrid')
plt.rcParams['figure.dpi'] = 400
plt.rcParams['savefig.dpi'] = 400
plt.rcParams['font.size'] = 14

# -----------------------------
# Helper functions
# -----------------------------
def gaussian_intensity(x, I0, x0, w):
    return I0 * np.exp(-2 * (x - x0)**2 / w**2)

def spot_size_evolution(z, w0, z0, wavelength=632.8e-9):
    z_R = np.pi * w0**2 / wavelength
    return w0 * np.sqrt(1 + ((z - z0) / z_R)**2)

def calculate_transmission_factor(attenuator_angle):
    theta_rad = np.radians(attenuator_angle)
    return np.cos(theta_rad)**2

def mean_and_stderr(arrays):
    a = np.array(arrays)
    mean = np.nanmean(a, axis=0)
    stderr = np.nanstd(a, axis=0, ddof=1) / np.sqrt(a.shape[0])
    return mean, stderr

# -----------------------------
# New data (user provided)
# Each dataset has reading1/2/3. We'll compute mean and stderr.
# -----------------------------
data_20cm = {
    'offset': [-0.50, -0.45, -0.40, -0.35, -0.30, -0.25, -0.20, -0.15, -0.10, -0.05, 0.00, 0.05, 0.10, 0.15, 0.20, 0.25, 0.30, 0.35, 0.40, 0.45, 0.50],
    'reading1': [0.048, 0.089, 0.226, 0.790, 1.012, 1.035, 1.223, 1.174, 1.325, 1.630, 1.639, 1.237, 1.025, 0.839, 0.559, 0.403, 0.340, 0.385, 0.166, 0.087, 0.049],
    'reading2': [0.049, 0.090, 0.221, 0.788, 1.011, 1.036, 1.224, 1.176, 1.326, 1.628, 1.638, 1.237, 1.026, 0.841, 0.558, 0.404, 0.340, 0.385, 0.166, 0.087, 0.044],
    'reading3': [0.048, 0.090, 0.221, 0.789, 1.012, 1.035, 1.222, 1.177, 1.328, 1.630, 1.640, 1.238, 1.025, 0.839, 0.559, 0.403, 0.340, 0.385, 0.166, 0.086, 0.044],
    'attenuator': 85
}

data_50cm = {
    'offset': [-1.00, -0.90, -0.80, -0.70, -0.60, -0.50, -0.40, -0.30, -0.20, -0.10, 0.00, 0.10, 0.20, 0.30, 0.40, 0.50, 0.60, 0.70, 0.80, 0.90, 1.00],
    'reading1': [0.004, 0.012, 0.018, 0.016, 0.084, 0.284, 0.640, 1.112, 1.217, 2.406, 2.563, 2.564, 2.054, 1.319, 0.959, 0.312, 0.099, 0.029, 0.008, 0.008, 0.003],
    'reading2': [0.003, 0.010, 0.016, 0.016, 0.085, 0.285, 0.642, 1.113, 1.213, 2.395, 2.562, 2.565, 2.053, 1.317, 0.960, 0.312, 0.099, 0.029, 0.009, 0.008, 0.003],
    'reading3': [0.003, 0.010, 0.016, 0.016, 0.084, 0.284, 0.638, 1.111, 1.218, 2.403, 2.564, 2.564, 2.053, 1.316, 0.959, 0.314, 0.099, 0.029, 0.009, 0.008, 0.002],
    'attenuator': 80
}

data_1m = {
    'offset': [-1.00, -0.90, -0.80, -0.70, -0.60, -0.50, -0.40, -0.30, -0.20, -0.10, 0.00, 0.10, 0.20, 0.30, 0.40, 0.50, 0.60, 0.70, 0.80, 0.90, 1.00],
    'reading1': [0.042, 0.122, 0.236, 0.258, 0.653, 1.057, 1.532, 1.630, 2.031, 2.444, 2.569, 2.225, 1.593, 1.089, 1.080, 0.384, 0.199, 0.079, 0.039, 0.019, 0.007],
    'reading2': [0.043, 0.123, 0.236, 0.258, 0.653, 1.057, 1.532, 1.630, 2.031, 2.444, 2.569, 2.225, 1.593, 1.089, 1.080, 0.384, 0.199, 0.079, 0.039, 0.019, 0.007],
    'reading3': [0.042, 0.122, 0.234, 0.259, 0.657, 1.057, 1.533, 1.627, 2.033, 2.449, 2.570, 2.219, 1.593, 1.090, 1.082, 0.385, 0.198, 0.078, 0.038, 0.019, 0.005],
    'attenuator': 75
}

data_2m = {
    'offset': [-2.00, -1.80, -1.60, -1.40, -1.20, -1.00, -0.80, -0.60, -0.40, -0.20, 0.00, 0.20, 0.40, 0.60, 0.80, 1.00, 1.20, 1.40, 1.60, 1.80, 2.00],
    'reading1': [0.019, 0.038, 0.076, 0.158, 0.306, 0.540, 0.935, 1.358, 1.814, 2.217, 2.277, 2.030, 1.552, 1.063, 0.703, 0.278, 0.111, 0.060, 0.020, 0.012, 0.002],
    'reading2': [0.018, 0.039, 0.078, 0.160, 0.308, 0.534, 0.938, 1.359, 1.819, 2.203, 2.263, 2.019, 1.551, 1.061, 0.700, 0.283, 0.110, 0.061, 0.021, 0.012, 0.002],
    'reading3': [0.019, 0.039, 0.079, 0.160, 0.312, 0.540, 0.933, 1.360, 1.824, 2.219, 2.270, 2.032, 1.553, 1.062, 0.704, 0.279, 0.111, 0.060, 0.021, 0.011, 0.002],
    'attenuator': 65
}

data_5m = {
    'offset': [-4.00, -3.60, -3.20, -2.80, -2.40, -2.00, -1.60, -1.20, -0.80, -0.40, 0.00, 0.40, 0.80, 1.20, 1.60, 2.00, 2.40, 2.80, 3.20, 3.60, 4.00],
    'reading1': [0.023, 0.048, 0.092, 0.232, 0.473, 0.809, 1.266, 1.754, 2.177, 2.421, 2.522, 2.445, 2.091, 1.690, 1.111, 0.739, 0.408, 0.166, 0.073, 0.035, 0.015],
    'reading2': [0.021, 0.049, 0.093, 0.237, 0.478, 0.796, 1.268, 1.755, 2.180, 2.434, 2.514, 2.446, 2.090, 1.689, 1.106, 0.735, 0.404, 0.165, 0.071, 0.033, 0.016],
    'reading3': [0.021, 0.048, 0.091, 0.240, 0.479, 0.795, 1.269, 1.756, 2.183, 2.428, 2.518, 2.448, 2.089, 1.693, 1.110, 0.739, 0.409, 0.164, 0.072, 0.032, 0.014],
    'attenuator': 45
}

data_10m = {
    'offset': [-5.00, -4.50, -4.00, -3.50, -3.00, -2.50, -2.00, -1.50, -1.00, -0.50, 0.00, 0.50, 1.00, 1.50, 2.00, 2.50, 3.00, 3.50, 4.00, 4.50, 5.00],
    'reading1': [0.301, 0.476, 0.692, 0.981, 1.300, 1.611, 1.931, 2.222, 2.498, 2.660, 2.755, 2.727, 2.626, 2.394, 2.132, 1.804, 1.495, 1.184, 0.905, 0.658, 0.466],
    'reading2': [0.305, 0.469, 0.697, 0.985, 1.301, 1.612, 1.929, 2.223, 2.494, 2.657, 2.751, 2.733, 2.621, 2.393, 2.128, 1.803, 1.497, 1.184, 0.903, 0.657, 0.468],
    'reading3': [0.305, 0.472, 0.696, 0.976, 1.295, 1.615, 1.932, 2.222, 2.498, 2.662, 2.749, 2.725, 2.627, 2.401, 2.125, 1.801, 1.499, 1.180, 0.907, 0.657, 0.468],
    'attenuator': 25
}

data_15m = {
    'offset': [-6.00, -5.40, -4.80, -4.20, -3.60, -3.00, -2.40, -1.80, -1.20, -0.60, 0.00, 0.60, 1.20, 1.80, 2.40, 3.00, 3.60, 4.20, 4.80, 5.40, 6.00],
    'reading1': [0.334, 0.433, 0.515, 0.626, 0.743, 0.833, 0.929, 1.020, 1.080, 1.107, 1.118, 1.108, 1.070, 1.003, 0.918, 0.820, 0.707, 0.604, 0.497, 0.404, 0.312],
    'reading2': [0.332, 0.434, 0.516, 0.625, 0.742, 0.833, 0.928, 1.018, 1.084, 1.108, 1.120, 1.107, 1.067, 1.003, 0.922, 0.819, 0.703, 0.605, 0.497, 0.405, 0.313],
    'reading3': [0.333, 0.437, 0.522, 0.628, 0.743, 0.831, 0.928, 1.022, 1.085, 1.109, 1.170, 1.108, 1.070, 0.999, 0.920, 0.822, 0.700, 0.608, 0.503, 0.405, 0.314],
    'attenuator': 0
}

all_input = {20:data_20cm,50:data_50cm,100:data_1m,200:data_2m,500:data_5m,1000:data_10m,1500:data_15m}

# -----------------------------
# Process inputs: compute mean and stderr for each dataset
# -----------------------------
all_data = {}
for dist, d in all_input.items():
    offsets = np.array(d['offset'])
    readings = np.vstack([d['reading1'], d['reading2'], d['reading3']])
    mean_reading = np.mean(readings, axis=0)
    std_reading = np.std(readings, axis=0, ddof=1)
    stderr_reading = std_reading / np.sqrt(readings.shape[0])
    all_data[dist] = {
        'offset': offsets,
        'reading_mean': mean_reading,
        'reading_std': std_reading,
        'reading_stderr': stderr_reading,
        'attenuator': d['attenuator']
    }

# -----------------------------
# Fit profiles and extract parameters
# -----------------------------
def fit_gaussian_profile_with_errors(d, distance_cm):
    x = d['offset']
    y = d['reading_mean']
    yerr = d['reading_stderr']
    attenuator = d['attenuator']
    T = calculate_transmission_factor(attenuator)
    y_corrected = y / T if T>0 else y
    y_normalized = y / np.max(y)
    # initial guesses
    I0_guess = 1.0
    x0_guess = x[np.argmax(y)]
    half_max = np.max(y_normalized)/2
    indices = np.where(y_normalized > half_max)[0]
    if len(indices)>0:
        fwhm = x[indices[-1]] - x[indices[0]]
        w_guess = fwhm / (2*np.sqrt(np.log(2)))
    else:
        w_guess = 0.5
    try:
        popt, pcov = curve_fit(gaussian_intensity, x, y_normalized, p0=[I0_guess, x0_guess, w_guess], sigma=yerr/np.max(y), absolute_sigma=False, maxfev=10000)
        I0_fit, x0_fit, w_fit = popt
        perr = np.sqrt(np.diag(pcov))
        residuals = y_normalized - gaussian_intensity(x, *popt)
        ss_res = np.sum(residuals**2)
        ss_tot = np.sum((y_normalized - np.mean(y_normalized))**2)
        r_squared = 1 - ss_res/ss_tot
        fwhm_fit = 2*abs(w_fit)*np.sqrt(np.log(2))
        return {'distance_cm':distance_cm,'spot_size_mm':abs(w_fit),'fwhm_mm':fwhm_fit,'center_position':x0_fit,'max_intensity_corrected':np.max(y_corrected),'r_squared':r_squared,'x':x,'y_mean':y,'yerr':yerr,'y_corrected':y_corrected,'y_fit':gaussian_intensity(x, *popt),'popt':popt,'pcov':pcov,'transmission':T,'attenuator':attenuator}
    except Exception as e:
        print("Fit failed for", distance_cm, e)
        return None

results = []
for dist, d in sorted(all_data.items()):
    res = fit_gaussian_profile_with_errors(d, dist)
    if res:
        results.append(res)

distances_cm = np.array([r['distance_cm'] for r in results])
distances_m = distances_cm/100.0
spot_sizes_mm = np.array([r['spot_size_mm'] for r in results])
spot_sizes_m = spot_sizes_mm/1000.0
wavelength = 632.8e-9

# Fit spot size evolution to get W0 and z0
def spot_size_with_offset(z, w0, z0):
    return spot_size_evolution(z, w0, z0, wavelength)

W0_estimate = spot_sizes_m[0]
popt_evol, pcov_evol = curve_fit(spot_size_with_offset, distances_m, spot_sizes_m, p0=[W0_estimate, 0.0], maxfev=10000)
W0_fit, z0_fit = popt_evol
z_R_fit = np.pi * W0_fit**2 / wavelength
theta_theoretical = wavelength / (np.pi * W0_fit)

# Far-field divergence (linear fit of w vs z using last 3 points)
far_idx = [-3, -2, -1]
far_z = distances_m[far_idx]
far_w = spot_sizes_m[far_idx]
slope, intercept, r_val, p_val, std_err = stats.linregress(far_z, far_w)
Theta_experimental = slope
M_squared = Theta_experimental / theta_theoretical

# -----------------------------
# PLOTTING
# -----------------------------

colors = plt.cm.viridis(np.linspace(0,1,len(results)))

# FIGURE A: All corrected intensity Gaussians with error bars
fig = plt.figure(figsize=(10,6))
ax = fig.add_subplot(111)
for idx,r in enumerate(results):
    x = r['x']
    y = r['y_corrected']
    # normalize for plotting similar scale? keep actual corrected intensity
    ax.errorbar(x, y, yerr=r['yerr'], fmt='o', color=colors[idx], label=f"{r['distance_cm']} cm (att={r['attenuator']}°)", capsize=3)
    x_smooth = np.linspace(min(x)-0.5, max(x)+0.5, 400)
    # plot fitted gaussian scaled to corrected max
    fit_norm = r['y_fit']/np.max(r['y_fit'])*np.max(y)
    ax.plot(x, fit_norm, '-', color=colors[idx], alpha=0.8)
ax.set_xlabel('Position (mm)')
ax.set_ylabel('Corrected Intensity (V)')
ax.set_title('All Corrected Intensity Profiles with Error Bars')
ax.legend(fontsize=8)
ax.grid(True)
plt.tight_layout()
plt.show()

# FIGURE B: Normalized profiles with error bars and fits
fig2 = plt.figure(figsize=(10,6))
ax2 = fig2.add_subplot(111)
for idx,r in enumerate(results):
    x = r['x']
    y = r['y_mean'] / np.max(r['y_mean'])
    yerr = r['yerr'] / np.max(r['y_mean'])
    ax2.errorbar(x, y, yerr=yerr, fmt='o', color=colors[idx], label=f"{r['distance_cm']} cm", capsize=3)
    x_smooth = np.linspace(min(x)-0.5, max(x)+0.5, 400)
    w = r['spot_size_mm']
    center = r['center_position']
    ax2.plot(x_smooth, gaussian_intensity(x_smooth, 1.0, center, w), '-', color=colors[idx], alpha=0.7)
ax2.set_xlabel('Position (mm)')
ax2.set_ylabel('Normalized Intensity')
ax2.set_title('Normalized Profiles with Fits and Error Bars')
ax2.legend(fontsize=8)
ax2.grid(True)
plt.tight_layout()
plt.show()

# FIGURE C: Spot size evolution with errorbars and theoretical fit
fig3 = plt.figure(figsize=(10,6))
ax3 = fig3.add_subplot(111)
ax3.errorbar(distances_m*100, spot_sizes_mm, yerr=np.zeros_like(spot_sizes_mm)+0.02*spot_sizes_mm, fmt='o', capsize=5, label='Measured (±2%)')
z_theory = np.linspace(0, max(distances_m), 200)
w_theory = spot_size_with_offset(z_theory, W0_fit, z0_fit)*1000
ax3.plot(z_theory*100, w_theory, 'r-', label=f'Theory W0={W0_fit*1000:.3f} mm')
ax3.set_xlabel('Distance (cm)')
ax3.set_ylabel('Spot size W (mm)')
ax3.set_title('Spot Size Evolution with Theoretical Fit')
ax3.legend()
ax3.grid(True)
plt.tight_layout()
plt.show()

# FIGURE D: Divergence analysis - linear fit w vs z (far field)
fig4 = plt.figure(figsize=(10,6))
ax4 = fig4.add_subplot(111)
ax4.scatter(distances_m*100, spot_sizes_mm, label='All data')
ax4.scatter(far_z*100, far_w*1000, color='red', label='Far-field points')
z_fit = np.linspace(min(far_z), max(distances_m)*1.1, 100)
w_fit = slope * z_fit + intercept
ax4.plot(z_fit*100, w_fit*1000, 'g--', label=f'Linear fit (far): slope={slope*1000:.3f} mrad')
ax4.set_xlabel('Distance (cm)')
ax4.set_ylabel('Spot size (mm)')
ax4.set_title('Divergence (far-field linear fit)')
ax4.legend()
ax4.grid(True)
plt.tight_layout()
plt.show()

# FIGURE E: Regression w^2 vs z^2 (linear) - user's extra request
z_vals = distances_m
w_vals = spot_sizes_m
z2 = z_vals**2
w2 = w_vals**2
slope2, intercept2, r2_val, p2, se2 = stats.linregress(z2, w2)
fig5 = plt.figure(figsize=(8,6))
ax5 = fig5.add_subplot(111)
ax5.scatter(z2, w2, label='Data (w^2 vs z^2)')
ax5.plot(z2, intercept2 + slope2*z2, 'r--', label=f'Fit: w^2 = {intercept2:.3e} + {slope2:.3e} z^2 (R²={r2_val**2:.3f})')
ax5.set_xlabel('z^2 (m^2)')
ax5.set_ylabel('w^2 (m^2)')
ax5.set_title('Linear regression: w^2 vs z^2')
ax5.legend()
ax5.grid(True)
plt.tight_layout()
plt.show()

# FIGURE F: Intensity decay (peak) with errorbars and 1/w^2 theory
fig6 = plt.figure(figsize=(8,6))
ax6 = fig6.add_subplot(111)
peak_intensities = np.array([r['max_intensity_corrected'] for r in results])
peak_err = np.array([np.max(r['yerr']) for r in results])
ax6.errorbar(distances_cm, peak_intensities, yerr=peak_err, fmt='o', capsize=4, label='Measured peak (with stderr)')
I0_theory = peak_intensities[-1] * (spot_sizes_m[-1]**2)
I_theory = I0_theory / (spot_sizes_m**2)
ax6.plot(distances_cm, I_theory*1000, 'r--', label='Theory ∝ 1/w^2 (scaled)')
ax6.set_xscale('log')
ax6.set_yscale('log')
ax6.set_xlabel('Distance (cm)')
ax6.set_ylabel('Peak intensity (V)')
ax6.set_title('Peak intensity decay (log-log)')
ax6.legend()
ax6.grid(True, which='both', alpha=0.3)
plt.tight_layout()
plt.show()

# FIGURE G: 3D visualization with surface (user requested)
fig7 = plt.figure(figsize=(12,8))
ax7 = fig7.add_subplot(111, projection='3d')

# Build a surface: X = position (mm), Y = distance (cm), Z = normalized intensity
positions = np.linspace(-10,10,200)
distances_plot = np.linspace(0, max(distances_cm), 200)
Xg, Yg = np.meshgrid(positions, distances_plot)
# compute w(z) in mm for Yg (convert cm to m for function, then to mm)
Wz = spot_size_with_offset(Yg/100.0, W0_fit, z0_fit)*1000  # mm
Zg = np.exp(-2 * (Xg**2) / (Wz.T**2)).T  # normalized intensity, careful with orientation

# Plot surface
surf = ax7.plot_surface(Xg, Yg, Zg, cmap='hot', alpha=0.6, linewidth=0, antialiased=True)

# overlay measurement ribbons
for r,c in zip(results, colors):
    x = r['x']
    z_line = r['distance_cm']
    y_profile = r['y_mean'] / np.max(r['y_mean'])
    ax7.plot(x, np.full_like(x, z_line), y_profile, '-', color=c, linewidth=2)

ax7.set_xlabel('Position (mm)')
ax7.set_ylabel('Distance (cm)')
ax7.set_zlabel('Normalized Intensity')
ax7.set_title('3D Visualization of Gaussian Beam Intensity Evolution (Surface + Measurements)')
ax7.view_init(elev=30, azim=-60)
plt.tight_layout()
plt.show()

# FIGURE H: Contour map (2D) of intensity evolution with beam edges
fig8 = plt.figure(figsize=(10,6))
ax8 = fig8.add_subplot(111)
Z_grid = np.zeros((len(positions), len(distances_plot)))
for i, zcm in enumerate(distances_plot):
    w_z_mm = spot_size_with_offset(zcm/100.0, W0_fit, z0_fit)*1000
    Z_grid[:, i] = np.exp(-2 * positions**2 / w_z_mm**2)
levels = np.linspace(0,1,20)
cont = ax8.contourf(distances_plot, positions, Z_grid, levels=levels, cmap='hot')
plt.colorbar(cont, ax=ax8, label='Normalized Intensity')
# edges
w_edge = spot_size_with_offset(distances_plot/100.0, W0_fit, z0_fit)*1000
ax8.plot(distances_plot, w_edge, 'b-', label='1/e^2 edge')
ax8.plot(distances_plot, -w_edge, 'b-')
for r in results:
    ax8.scatter(r['distance_cm'], r['spot_size_mm'], c='white', edgecolor='k')
ax8.set_xlabel('Distance (cm)')
ax8.set_ylabel('Position (mm)')
ax8.set_title('Beam Intensity Contour Map')
ax8.legend()
plt.tight_layout()
plt.show()

# Additional: save the main figures to files (optional)
# plt.savefig('figure_all_corrected.png', dpi=400)

print('Done. All plots generated with error bars, regressions added, and 3D surface included.')
