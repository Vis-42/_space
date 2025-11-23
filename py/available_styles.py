import matplotlib.pyplot as plt
import matplotlib.style as mplstyle

print("Available matplotlib styles:")
print("=" * 40)

available_styles = plt.style.available
for i, style in enumerate(available_styles, 1):
    print(f"{i:2d}. {style}")

print(f"\nTotal: {len(available_styles)} styles available")
print("\nTo use a style, add this line after your imports:")
print("plt.style.use('style_name')")
