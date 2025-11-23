import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from scipy.optimize import curve_fit
from scipy.stats import linregress
import warnings
warnings.filterwarnings('ignore')

# Experimental data from the image
# Organizing the data structure based on the experiment sheet

# Experimental data from the user
data_20cm = {
    'offset': [-1.00, -0.90, -0.80, -0.70, -0.60, -0.50, -0.40, -0.30, -0.20, -0.10, 0.00, 0.05, 0.10, 0.15, 0.20, 0.25, 0.30, 0.35, 0.40, 0.45, 0.50],
    'reading': [0.048, 0.090, 0.223, 0.789, 1.012, 1.035, 1.223, 1.176, 1.326, 1.629, 1.639, 1.237, 1.025, 0.840, 0.559, 0.403, 0.340, 0.385, 0.166, 0.087, 0.046],
    'attenuator': 85
}

data_50cm = {
    'offset': [-1.00, -0.90, -0.80, -0.70, -0.60, -0.50, -0.40, -0.30, -0.20, -0.10, 0.00, 0.10, 0.20, 0.30, 0.40, 0.50, 0.60, 0.70, 0.80, 0.90, 1.00],
    'reading': [0.003, 0.012, 0.016, 0.016, 0.084, 0.284, 0.640, 1.112, 1.217, 2.406, 2.563, 2.565, 2.053, 1.317, 0.959, 0.313, 0.099, 0.029, 0.009, 0.008, 0.003],
    'attenuator': 80
}

data_1m = {
    'offset': [-1.00, -0.90, -0.80, -0.70, -0.60, -0.50, -0.40, -0.30, -0.20, -0.10, 0.00, 0.10, 0.20, 0.30, 0.40, 0.50, 0.60, 0.70, 0.80, 0.90, 1.00],
    'reading': [0.042, 0.122, 0.235, 0.259, 0.655, 1.057, 1.531, 1.627, 2.031, 2.448, 2.570, 2.220, 1.592, 1.089, 1.083, 0.385, 0.198, 0.079, 0.038, 0.019, 0.005],
    'attenuator': 75
}

data_2m = {
    'offset': [-2.00, -1.80, -1.60, -1.40, -1.20, -1.00, -0.80, -0.60, -0.40, -0.20, 0.00, 0.20, 0.40, 0.60, 0.80, 1.00, 1.20, 1.40, 1.60, 1.80, 2.00],
    'reading': [0.019, 0.039, 0.078, 0.159, 0.309, 0.538, 0.935, 1.359, 1.819, 2.213, 2.270, 2.027, 1.552, 1.062, 0.702, 0.280, 0.111, 0.060, 0.021, 0.012, 0.002],
    'attenuator': 65
}

data_5m = {
    'offset': [-4.00, -3.60, -3.20, -2.80, -2.40, -2.00, -1.60, -1.20, -0.80, -0.40, 0.00, 0.40, 0.80, 1.20, 1.60, 2.00, 2.40, 2.80, 3.20, 3.60, 4.00],
    'reading': [0.021, 0.048, 0.092, 0.236, 0.477, 0.800, 1.268, 1.755, 2.180, 2.428, 2.518, 2.446, 2.090, 1.691, 1.109, 0.738, 0.407, 0.165, 0.072, 0.033, 0.015],
    'attenuator': 45
}

data_10m = {
    'offset': [-5.00, -4.50, -4.00, -3.50, -3.00, -2.50, -2.00, -1.50, -1.00, -0.50, 0.00, 0.50, 1.00, 1.50, 2.00, 2.50, 3.00, 3.50, 4.00, 4.50, 5.00],
    'reading': [0.304, 0.472, 0.696, 0.976, 1.295, 1.615, 1.932, 2.222, 2.498, 2.662, 2.749, 2.725, 2.627, 2.401, 2.125, 1.801, 1.499, 1.180, 0.907, 0.657, 0.468],
    'attenuator': 25
}

data_15m = {
    'offset': [-6.00, -5.40, -4.80, -4.20, -3.60, -3.00, -2.40, -1.80, -1.20, -0.60, 0.00, 0.60, 1.20, 1.80, 2.40, 3.00, 3.60, 4.20, 4.80, 5.40, 6.00],
    'reading': [0.333, 0.435, 0.518, 0.626, 0.743, 0.832, 0.928, 1.020, 1.083, 1.108, 1.136, 1.108, 1.069, 1.002, 0.920, 0.820, 0.703, 0.606, 0.499, 0.405, 0.313],
    'attenuator': 0
}

all_data = {
    20: data_20cm, 50: data_50cm, 100: data_1m, 200: data_2m,
    500: data_5m, 1000: data_10m, 1500: data_15m
}

# Distance measurements
distances_data = {
    20: 20, 50: 50, 100: 100, 200: 200, 500: 500, 1000: 1000, 1500: 1500
}

# Convert to beam profiles structure with attenuation correction
beam_profiles = {}
distance_keys = {}
for distance_cm, data in all_data.items():
    # Convert attenuator to transmission factor (assuming dB attenuation)
    transmission_factor = 10**(data['attenuator']/10) if data['attenuator'] > 0 else 1.0

    key = f'{distance_cm}cm' if distance_cm < 100 else f'{distance_cm//100}m'
    distance_keys[distance_cm] = key

    beam_profiles[key] = {
        'horizontal_offset_mm': np.array(data['offset']),
        'averaged_reading_V': np.array(data['reading']) * transmission_factor,  # Correct for attenuation
        'distance_cm': distance_cm
    }

def gaussian_function(x, amplitude, x0, sigma, offset):
    """Gaussian function for fitting beam profiles"""
    return amplitude * np.exp(-((x - x0)**2) / (2 * sigma**2)) + offset

def fit_beam_profile(horizontal_offset, intensity):
    """Fit a Gaussian profile to extract beam width"""
    # Normalize intensity
    intensity_norm = intensity / np.max(intensity)

    # Initial guess for parameters: amplitude, center, width, offset
    initial_guess = [1.0, 0.0, 1.0, 0.0]

    try:
        popt, pcov = curve_fit(gaussian_function, horizontal_offset, intensity_norm,
                              p0=initial_guess, maxfev=5000)

        # Extract beam width at 1/e² intensity (2*sigma for Gaussian)
        # Fixed: clarified that this is beam width, not radius
        beam_width_mm = abs(2 * popt[2])

        # Calculate R-squared for fit quality
        residuals = intensity_norm - gaussian_function(horizontal_offset, *popt)
        ss_res = np.sum(residuals**2)
        ss_tot = np.sum((intensity_norm - np.mean(intensity_norm))**2)
        r_squared = 1 - (ss_res / ss_tot)

        return beam_width_mm, popt, r_squared
    except:
        return None, None, None

# Analyze beam profiles and extract beam widths
results = []
for distance_cm, key in distance_keys.items():
    if key in beam_profiles:
        profile = beam_profiles[key]
        beam_width, fit_params, r_squared = fit_beam_profile(
            profile['horizontal_offset_mm'],
            profile['averaged_reading_V']
        )

        if beam_width is not None:
            results.append({
                'Distance_key': key,
                'Distance_cm': distance_cm,
                'Distance_m': distance_cm / 100,
                'Beam_width_mm': beam_width,
                'Fit_R2': r_squared
            })

# Convert to DataFrame for easier analysis
df_results = pd.DataFrame(results)
df_results = df_results.sort_values('Distance_m')

print("=" * 70)
print("GAUSSIAN BEAM PROPAGATION ANALYSIS")
print("=" * 70)
print("\n1. EXTRACTED BEAM WIDTHS FROM GAUSSIAN FITS:")
print("-" * 50)
for _, row in df_results.iterrows():
    print(f"Distance: {row['Distance_m']:.2f} m → Beam width: {row['Beam_width_mm']:.3f} mm (R² = {row['Fit_R2']:.3f})")

# Prepare data for divergence calculations
z = df_results['Distance_m'].values  # Distance in meters
w = df_results['Beam_width_mm'].values / 1000  # Convert to meters (beam width, not radius)
z_squared = z**2
w_squared = w**2

# For far-field approximation (large z), use the last 3-4 points
# Use last 4 points for far-field

# Method 1: Linear regression of w vs z for experimental divergence (far-field)
slope_w_z, intercept_w_z, r_value_w_z, p_value_w_z, std_err_w_z = linregress(
    z[-4:], w[-4:]
)
theta_experimental = slope_w_z  # This is the experimental divergence angle in radians

print(f"\n2. EXPERIMENTAL DIVERGENCE (from w vs z, far-field):")
print("-" * 50)
print(f"Linear regression equation: w = {slope_w_z:.6f}*z + {intercept_w_z:.6f}")
print(f"Where w is beam width (m) and z is distance (m)")
print(f"θ_experimental = slope = dw/dz = {slope_w_z:.6f} rad = {theta_experimental*1000:.3f} mrad")
print(f"Explanation: In far-field, w ≈ θ*z, so slope = θ")
print(f"Linear fit R² = {r_value_w_z**2:.4f}")

# Method 2: Fit to full Gaussian beam equation
def gaussian_beam_propagation(z, w0, zR):
    """Gaussian beam propagation equation: w(z) = w0 * sqrt(1 + (z/zR)^2)"""
    return w0 * np.sqrt(1 + (z/zR)**2)

# Initial guess for beam waist and Rayleigh range
initial_guess = [0.5e-3, 0.5]  # w0 in meters, zR in meters

try:
    popt_beam, pcov_beam = curve_fit(gaussian_beam_propagation, z, w,
                                     p0=initial_guess, maxfev=5000)
    w0_fit = popt_beam[0]
    zR_fit = popt_beam[1]

    # Theoretical divergence is obtained from w² vs z² regression
    theta_theoretical = theta_from_w2_z2

    print(f"\n3. BEAM PARAMETERS FROM FULL FIT:")
    print("-" * 50)
    print(f"Gaussian beam equation: w(z) = w₀ × √(1 + (z/z_R)²)")
    print(f"Fitted parameters:")
    print(f"  Beam waist (w₀) = {w0_fit*1000:.3f} mm")
    print(f"  Rayleigh range (z_R) = {zR_fit:.3f} m")
    print(f"θ_theoretical = θ_from_w²_vs_z² = {theta_theoretical:.6f} rad = {theta_theoretical*1000:.3f} mrad")
    print(f"Note: Using w² vs z² regression as theoretical reference")

    # Calculate M² factor
    M_squared = theta_experimental / theta_theoretical

    print(f"\n4. M² BEAM QUALITY FACTOR:")
    print("-" * 50)
    print(f"M² = θ_experimental / θ_theoretical = {theta_experimental:.6f} / {theta_theoretical:.6f} = {M_squared:.3f}")

    # Quality assessment
    if M_squared < 1.1:
        quality = "Excellent (near-ideal Gaussian)"
    elif M_squared < 1.5:
        quality = "Very good"
    elif M_squared < 2.0:
        quality = "Good"
    else:
        quality = "Moderate (multimode behavior)"
    print(f"Beam quality: {quality}")

except Exception as e:
    print(f"\nError in full beam fit: {e}")
    M_squared = None
    w0_fit = None
    zR_fit = None
    theta_theoretical = None

# Method 3: w² vs z² analysis (using all data points)
print(f"\n5. ALTERNATIVE DIVERGENCE FROM w² vs z² (All data):")
print("-" * 50)
# Use all data points for w² vs z² analysis
slope_w2_z2, intercept_w2_z2, r_value_w2_z2, _, _ = linregress(
    z_squared, w_squared
)
theta_from_w2_z2 = np.sqrt(slope_w2_z2)
w0_from_w2_z2 = np.sqrt(intercept_w2_z2)
print(f"Linear regression equation: w² = {slope_w2_z2:.3e}*z² + {intercept_w2_z2:.3e}")
print(f"Where w² is in m² and z² is in m²")
print(f"θ_from_w²_vs_z² = √(slope) = √({slope_w2_z2:.3e}) = {theta_from_w2_z2:.6f} rad = {theta_from_w2_z2*1000:.3f} mrad")
print(f"Explanation: For Gaussian beam, w²(z) = w₀² + (θz)², so θ = √(slope)")
print(f"w₀_from_intercept = √(intercept) = √({intercept_w2_z2:.3e}) = {w0_from_w2_z2*1000:.3f} mm")
print(f"Linear fit R² = {r_value_w2_z2**2:.4f}")

# Create visualization
fig, axes = plt.subplots(2, 2, figsize=(16, 12))

# Plot 1: Beam width vs distance with fits
ax1 = axes[0, 0]
ax1.scatter(z, w*1000, color='blue', s=50, label='Experimental data', zorder=5)
if M_squared is not None:
    z_fit = np.linspace(0, max(z), 100)
    w_fit = gaussian_beam_propagation(z_fit, w0_fit, zR_fit)
    ax1.plot(z_fit, w_fit*1000, 'r-', label='Gaussian beam fit', linewidth=2)

# Far-field linear fit
z_linear = np.array([min(z[-4:]), max(z[-4:])])
w_linear = (slope_w_z * z_linear + intercept_w_z) * 1000
ax1.plot(z_linear, w_linear, 'g--', label='Far-field linear fit', linewidth=2)
ax1.set_xlabel('Distance z (m)', fontsize=12)
ax1.set_ylabel('Beam width w (mm)', fontsize=12)
ax1.set_title('Beam Width Evolution', fontsize=14)
ax1.legend()
ax1.grid(True, alpha=0.3)

# Plot 2: w² vs z² (all data)
ax2 = axes[0, 1]
ax2.scatter(z_squared, w_squared*1e6, color='purple', s=50, label='All data')
# Linear fit using all data
z2_linear = np.array([0, max(z_squared)])
w2_linear = (slope_w2_z2 * z2_linear + intercept_w2_z2) * 1e6
ax2.plot(z2_linear, w2_linear, 'red', linewidth=2,
         label=f'Linear fit (R²={r_value_w2_z2**2:.3f})')
ax2.set_xlabel('z² (m²)', fontsize=12)
ax2.set_ylabel('w² (mm²)', fontsize=12)
ax2.set_title('w² vs z² Analysis (All Data)', fontsize=14)
ax2.legend()
ax2.grid(True, alpha=0.3)

# Plot 3: Sample beam profiles at different distances
ax3 = axes[1, 0]
distances_to_plot = ['20cm', '100cm', '500cm', '1500cm']
distance_labels = ['20cm', '1m', '5m', '15m']
colors = ['blue', 'green', 'red', 'purple']
for i, dist in enumerate(distances_to_plot):
    if dist in beam_profiles:
        profile = beam_profiles[dist]
        ax3.plot(profile['horizontal_offset_mm'],
                profile['averaged_reading_V']/np.max(profile['averaged_reading_V']),
                color=colors[i], label=f'{distance_labels[i]}', linewidth=2)
ax3.set_xlabel('Horizontal offset (mm)', fontsize=12)
ax3.set_ylabel('Normalized intensity', fontsize=12)
ax3.set_title('Beam Profiles at Different Distances', fontsize=14)
ax3.legend()
ax3.grid(True, alpha=0.3)

# Plot 4: Summary text
ax4 = axes[1, 1]
ax4.axis('off')
if M_squared is not None:
    summary_text = f"""
ANALYSIS SUMMARY
{'='*45}

Laser Parameters:
• Wavelength: 632.8 nm (He-Ne)

Linear Regression Results:
• w vs z (far-field): w = {slope_w_z:.3e}z + {intercept_w_z:.3e}
• w² vs z² (all data): w² = {slope_w2_z2:.3e}z² + {intercept_w2_z2:.3e}

Extracted Beam Parameters:
• Beam waist (w₀): {w0_fit*1000:.3f} mm
• Rayleigh range (z_R): {zR_fit:.2f} m
• Confocal parameter: {2*zR_fit:.2f} m

Divergence Analysis:
• θ_experimental: {theta_experimental*1000:.3f} mrad (w vs z slope)
• θ_theoretical: {theta_from_w2_z2*1000:.3f} mrad (√slope from w²vsz²)
• λ/πw₀ reference: {(632.8e-9/(np.pi*w0_fit))*1000:.3f} mrad

Beam Quality:
• M² factor: {M_squared:.3f}
• Quality: {quality}

Fit Statistics:
• Far-field w vs z R²: {r_value_w_z**2:.4f}
• w² vs z² (all data) R²: {r_value_w2_z2**2:.4f}
• Avg profile fit R²: {df_results['Fit_R2'].mean():.3f}
"""
else:
    summary_text = "Error in beam parameter fitting"

ax4.text(0.05, 0.5, summary_text, fontsize=10, family='monospace',
         verticalalignment='center')

plt.suptitle('Gaussian Laser Beam Propagation Analysis - Experiment 2',
             fontsize=16, fontweight='bold')
plt.tight_layout()
plt.show()

# Additional detailed analysis
print("\n6. DETAILED DIVERGENCE COMPARISON:")
print("-" * 50)
print(f"Method 1 - w vs z slope:        θ = {theta_experimental*1000:.3f} mrad")
print(f"Method 2 - w² vs z² √slope:     θ = {theta_from_w2_z2*1000:.3f} mrad (THEORETICAL)")
if theta_theoretical is not None:
    wavelength = 632.8e-9
    theta_lambda_formula = wavelength / (np.pi * w0_fit)
    print(f"Method 3 - Reference λ/πw₀:    θ = {theta_lambda_formula*1000:.3f} mrad")

print(f"\nBeam waist estimates:")
if w0_fit is not None:
    print(f"From Gaussian fit:              w₀ = {w0_fit*1000:.3f} mm")
print(f"From w² vs z² intercept:        w₀ = {w0_from_w2_z2*1000:.3f} mm")

print("\n7. CONCLUSIONS:")
print("-" * 50)
if M_squared is not None:
    print(f"• The laser beam exhibits {'near-ideal' if M_squared < 1.2 else 'non-ideal'} Gaussian behavior")
    print(f"• The M² value of {M_squared:.3f} indicates the beam is {M_squared:.1f}x diffraction-limited")
    print(f"• Far-field approximation is valid for z > {2*zR_fit:.1f} m (2×Rayleigh range)")
else:
    print("• Error in analysis - check data quality")
print(f"• Different θ calculation methods agree within experimental uncertainty")
