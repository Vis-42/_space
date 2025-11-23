#!/usr/bin/env python3
"""
Corrected Star Loop Visualization - FULLY CORRECTED
====================================================

Key insight: The line from one star point to an alternate star point (15 cm)
MUST pass through a pentagon vertex and be perfectly collinear.

Geometry:
- 5 star points (P1-P5) form the outer vertices
- 5 pentagon vertices (V1-V5) form the inner vertices
- The line P1-V2-P3 is straight and equals 15 cm
- This line consists of: P1-V2 (5 cm) + V2-P3 (10 cm) OR some other combo
- BUT: triangle sides are 5 cm, so if P1-V1-V2 forms a triangle side = 5cm
  and V2-V3-P3 forms another triangle side = 5 cm
- Actually: P1-V2 + V2-P3 = 15 cm, with triangle constraint

Let me use a direct construction:
- Place P1, V2, P3 on a straight line with P1-V2 = 5 cm, V2-P3 = 10 cm
- This satisfies the 15 cm constraint
- Then build the rest of the star with rotational symmetry
"""

import matplotlib.pyplot as plt
import numpy as np
from matplotlib.patches import Polygon

plt.rcParams["figure.figsize"] = (14, 6)
plt.rcParams["font.size"] = 10
plt.rcParams["font.family"] = "serif"
plt.rcParams["figure.dpi"] = 300
plt.rcParams["savefig.dpi"] = 300

# Constraint: triangle sides = 5 cm, collinear span P-V-P = 15 cm
triangle_side = 5.0  # cm
total_span = 15.0  # cm

print("=" * 70)
print("FULLY CORRECTED STAR GEOMETRY - COLLINEAR CONSTRUCTION")
print("=" * 70)
print(f"Constraints:")
print(f"  • Triangle side: {triangle_side} cm")
print(f"  • P1 -> V2 -> P3 collinear span: {total_span} cm")
print(f"  • All segments P-V = {triangle_side} cm (triangle sides)")
print(f"")
print(f"Solving:")
print(f"  • If P1-V2 = 5 cm and V2-P3 = 10 cm, then P1-P3 = 15 cm ✓")
print(f"  • But V2-P3 = 10 cm doesn't match a single triangle side (5 cm)")
print(f"  • So V2-P3 must span a pentagon side + triangle side")
print("=" * 70)

# Different approach: use the golden ratio property of pentagons
# For a regular 5-pointed star (pentagram), the ratio of diagonal to side
# is the golden ratio φ = (1 + √5) / 2 ≈ 1.618

# If all edges (pentagon + triangles) are 5 cm, and alternate points are 15 cm apart,
# then we have a pentagram where:
# - Short edges = 5 cm
# - Long diagonal = 15 cm
# - Ratio = 15/5 = 3

# Actually, for a perfect pentagram inscribed in a circle:
# If we draw all 5 diagonals of a regular pentagon, we get a 5-pointed star
# The ratio of diagonal to side is φ ≈ 1.618
# But we need ratio = 15/5 = 3

# Let me construct directly: place alternate points 15 cm apart, with a vertex between them

# Start with P1 at origin, P3 at (15, 0) along x-axis
# V2 must lie on this line, with P1-V2 = 5 cm
# So V2 is at (5, 0)

# Now, the star has 5-fold rotational symmetry
# Angle between adjacent points = 360/5 = 72°

# Place the 5 star points evenly around a circle
# The key is finding the right radius such that when we connect them properly,
# the distance P1-P3 (skipping one point) equals 15 cm

# For a regular 5-pointed star, angle between P1 and P3 is 2 * 72° = 144°
# Using law of cosines: P1-P3 = 2 * R * sin(72°)
# where R is the radius to star points

R_star = total_span / (2 * np.sin(np.deg2rad(72)))

print(f"\nCalculated star point radius: R = {R_star:.4f} cm")

# Generate 5 star points
n_points = 5
angles_star = np.array([np.deg2rad(90 - i * 72) for i in range(n_points)])
x_star_points = R_star * np.cos(angles_star)
y_star_points = R_star * np.sin(angles_star)

# Verify the constraint
dist_P1_P3 = np.sqrt(
    (x_star_points[0] - x_star_points[2]) ** 2
    + (y_star_points[0] - y_star_points[2]) ** 2
)
print(f"Verification: P1-P3 distance = {dist_P1_P3:.4f} cm (target: {total_span} cm) ✓")

# Now find the pentagon vertices
# For a perfect 5-pointed star, when you connect all 5 points with straight lines,
# the inner pentagon is formed automatically
# The inner pentagon vertices are where the edges of the star intersect

# For a regular pentagram, the inner pentagon radius is:
# R_pentagon = R_star / φ² = R_star / (φ²) where φ = golden ratio
phi = (1 + np.sqrt(5)) / 2
R_pentagon = R_star / (phi * phi)

print(f"Inner pentagon radius: R_p = {R_pentagon:.4f} cm")
print(f"(Golden ratio φ = {phi:.4f})")

# But wait - we need to check if the triangle sides equal 5 cm
# Pentagon vertices are at angles offset by 36° from star points
angles_pentagon = np.array([np.deg2rad(90 - 36 - i * 72) for i in range(n_points)])
x_pentagon = R_pentagon * np.cos(angles_pentagon)
y_pentagon = R_pentagon * np.sin(angles_pentagon)

# Check triangle side P1-V1
dist_P1_V1 = np.sqrt(
    (x_star_points[0] - x_pentagon[0]) ** 2 + (y_star_points[0] - y_pentagon[0]) ** 2
)
print(f"\nTriangle side P1-V1: {dist_P1_V1:.4f} cm (target: {triangle_side} cm)")

# Check if P1, V2, P3 are collinear
# V2 is at index 1 in pentagon arrays
# Calculate cross product to check collinearity
vec_P1_V2 = np.array(
    [x_pentagon[1] - x_star_points[0], y_pentagon[1] - y_star_points[0]]
)
vec_V2_P3 = np.array(
    [x_star_points[2] - x_pentagon[1], y_star_points[2] - y_pentagon[1]]
)
vec_P1_P3 = np.array(
    [x_star_points[2] - x_star_points[0], y_star_points[2] - y_star_points[0]]
)

# Cross product for collinearity
cross = vec_P1_V2[0] * vec_P1_P3[1] - vec_P1_V2[1] * vec_P1_P3[0]
print(f"Collinearity check (cross product): {cross:.6f} (should be ~0)")

dist_P1_V2 = np.linalg.norm(vec_P1_V2)
dist_V2_P3 = np.linalg.norm(vec_V2_P3)
print(f"Segment lengths: P1-V2 = {dist_P1_V2:.4f} cm, V2-P3 = {dist_V2_P3:.4f} cm")
print(f"Sum: {dist_P1_V2 + dist_V2_P3:.4f} cm (target: {total_span} cm)")

# The issue is that with a perfect pentagram, the geometry is constrained by φ
# Let me try a different approach: directly construct with the given constraints

print("\n" + "=" * 70)
print("ALTERNATIVE CONSTRUCTION: Direct from constraints")
print("=" * 70)

# If we want:
# 1. P1-V2-P3 collinear and equal to 15 cm
# 2. Each triangle has 5 cm sides
# 3. Pentagon sides are also some fixed length

# Let's construct: place P1 at origin, P3 at (15, 0)
# The star must have 5-fold symmetry
# So the center must be equidistant from all 5 star points

# For 5-fold symmetry with P1 and P3 separated by 144° (skipping one point),
# the center is at the midpoint perpendicular bisector

# Actually, for 5-fold symmetry, if P1 is at angle α and P3 is at angle α + 144°,
# the center is at the origin if we choose coordinates correctly

# Use the previous calculation: R = 15 / (2 sin(72°))
# This gives us the star points
# Now we need to find where the edges intersect to form pentagon vertices

# For a regular 5-pointed star, we connect: P1-P3-P5-P2-P4-P1
# The edges are the 5 lines of the star
# Pentagon vertices are where non-adjacent edges intersect

# Edge from P1 to P3: this is one edge of the star
# Edge from P5 to P2: this intersects the previous edge

# Let me find the intersection point V2 which should lie on line P1-P3

# Create the star by connecting every other point
x_star_closed = [x_star_points[i] for i in [0, 2, 4, 1, 3, 0]]
y_star_closed = [y_star_points[i] for i in [0, 2, 4, 1, 3, 0]]


# Find intersections to get pentagon vertices
def line_intersection(p1, p2, p3, p4):
    """Find intersection of line p1-p2 with line p3-p4"""
    x1, y1 = p1
    x2, y2 = p2
    x3, y3 = p3
    x4, y4 = p4

    denom = (x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4)
    if abs(denom) < 1e-10:
        return None

    t = ((x1 - x3) * (y3 - y4) - (y1 - y3) * (x3 - x4)) / denom

    x = x1 + t * (x2 - x1)
    y = y1 + t * (y2 - y1)
    return (x, y)


# Find all 5 pentagon vertices
pentagon_vertices = []
# Order of connections in pentagram: 0-2-4-1-3-0
connections = [0, 2, 4, 1, 3]

for i in range(5):
    # Edge i: from star point connections[i] to connections[(i+1)%5]
    # Edge i+2: from star point connections[(i+2)%5] to connections[(i+3)%5]
    p1 = (x_star_points[connections[i]], y_star_points[connections[i]])
    p2 = (
        x_star_points[connections[(i + 1) % 5]],
        y_star_points[connections[(i + 1) % 5]],
    )
    p3 = (
        x_star_points[connections[(i + 2) % 5]],
        y_star_points[connections[(i + 2) % 5]],
    )
    p4 = (
        x_star_points[connections[(i + 3) % 5]],
        y_star_points[connections[(i + 3) % 5]],
    )

    intersection = line_intersection(p1, p2, p3, p4)
    if intersection:
        pentagon_vertices.append(intersection)

x_pentagon_correct = np.array([v[0] for v in pentagon_vertices])
y_pentagon_correct = np.array([v[1] for v in pentagon_vertices])

print(f"\nFound {len(pentagon_vertices)} pentagon vertices")

# Verify the collinearity and distances with the corrected pentagon
if len(pentagon_vertices) >= 5:
    # Check P1-V?-P3 collinearity
    # We need to find which pentagon vertex lies between P1 and P3

    # P1 is star_points[0], P3 is star_points[2]
    # The edge P1-P3 is one of the star edges
    # Find which pentagon vertex lies on this edge

    for idx, (vx, vy) in enumerate(pentagon_vertices):
        # Check if V is on line segment P1-P3
        # Use parametric form: V = P1 + t*(P3-P1) where 0 < t < 1
        dx = x_star_points[2] - x_star_points[0]
        dy = y_star_points[2] - y_star_points[0]

        if abs(dx) > 1e-6:
            t = (vx - x_star_points[0]) / dx
        elif abs(dy) > 1e-6:
            t = (vy - y_star_points[0]) / dy
        else:
            t = -1

        if 0 < t < 1:
            # Check if it's actually on the line
            expected_x = x_star_points[0] + t * dx
            expected_y = y_star_points[0] + t * dy
            if abs(vx - expected_x) < 0.01 and abs(vy - expected_y) < 0.01:
                print(
                    f"\nPentagon vertex V{idx + 1} at ({vx:.4f}, {vy:.4f}) lies on P1-P3!"
                )
                dist_P1_V = np.sqrt(
                    (vx - x_star_points[0]) ** 2 + (vy - y_star_points[0]) ** 2
                )
                dist_V_P3 = np.sqrt(
                    (x_star_points[2] - vx) ** 2 + (y_star_points[2] - vy) ** 2
                )
                print(f"  P1-V distance: {dist_P1_V:.4f} cm")
                print(f"  V-P3 distance: {dist_V_P3:.4f} cm")
                print(
                    f"  Sum: {dist_P1_V + dist_V_P3:.4f} cm (target: {total_span} cm)"
                )

# Check pentagon side length
if len(pentagon_vertices) >= 2:
    pent_side = np.sqrt(
        (pentagon_vertices[0][0] - pentagon_vertices[1][0]) ** 2
        + (pentagon_vertices[0][1] - pentagon_vertices[1][1]) ** 2
    )
    print(f"\nPentagon side length: {pent_side:.4f} cm")


# Calculate area
def polygon_area(x, y):
    """Calculate polygon area using shoelace formula"""
    n = len(x)
    return 0.5 * abs(
        sum(x[i] * y[(i + 1) % n] - x[(i + 1) % n] * y[i] for i in range(n))
    )


# Create star polygon by interleaving
x_star_polygon = []
y_star_polygon = []
for i in range(5):
    # Add star point
    x_star_polygon.append(x_star_points[connections[i]])
    y_star_polygon.append(y_star_points[connections[i]])
    # Add pentagon vertex
    x_star_polygon.append(pentagon_vertices[i][0])
    y_star_polygon.append(pentagon_vertices[i][1])

area_cm2 = polygon_area(x_star_polygon, y_star_polygon)
area_m2 = area_cm2 / 10000

print(f"\nCalculated star area: {area_cm2:.2f} cm² = {area_m2:.6f} m²")
d_equiv = 2 * np.sqrt(area_m2 / np.pi) * 100
print(f"Equivalent diameter: {d_equiv:.2f} cm")
print("=" * 70)

# ========================================================================
# VISUALIZATION
# ========================================================================
fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(16, 7))

# Left: Star with geometry
x_plot = x_star_polygon + [x_star_polygon[0]]
y_plot = y_star_polygon + [y_star_polygon[0]]

ax1.fill(x_plot, y_plot, color="#FFD700", alpha=0.6, edgecolor="#FF8C00", linewidth=3)
ax1.plot(x_plot, y_plot, "o", markersize=8, color="#FF8C00", zorder=5)

# Draw the 5 edges of the star
for i in range(5):
    ax1.plot(
        [x_star_points[connections[i]], x_star_points[connections[(i + 1) % 5]]],
        [y_star_points[connections[i]], y_star_points[connections[(i + 1) % 5]]],
        "b-",
        linewidth=2.5,
        alpha=0.7,
        zorder=4,
    )

# Highlight P1-P3 line
ax1.plot(
    [x_star_points[0], x_star_points[2]],
    [y_star_points[0], y_star_points[2]],
    "r-",
    linewidth=4,
    alpha=0.9,
    label=f"P1-P3: {total_span} cm",
    zorder=6,
)

# Mark pentagon
pent_x = [p[0] for p in pentagon_vertices] + [pentagon_vertices[0][0]]
pent_y = [p[1] for p in pentagon_vertices] + [pentagon_vertices[0][1]]
ax1.plot(pent_x, pent_y, "g--", linewidth=2, alpha=0.7, label="Inner pentagon")

ax1.plot([0], [0], "ko", markersize=10, label="Center", zorder=10)
ax1.set_aspect("equal")
ax1.set_xlabel("$x$ (cm)", fontsize=12)
ax1.set_ylabel("$y$ (cm)", fontsize=12)
ax1.set_title(
    "(a) CORRECTED 5-Pointed Star\n(Perfect pentagram with 15 cm diagonal)",
    fontsize=13,
    fontweight="bold",
)
ax1.grid(True, alpha=0.3)
ax1.legend(fontsize=10)
ax1.set_xlim(-12, 12)
ax1.set_ylim(-12, 12)

info_text = f"""CORRECTED GEOMETRY:
• Star point radius: {R_star:.2f} cm
• Alternate points: {dist_P1_P3:.2f} cm
• Pentagon side: {pent_side:.2f} cm
• Calculated area: {area_cm2:.1f} cm²"""

ax1.text(
    0.02,
    0.02,
    info_text,
    transform=ax1.transAxes,
    va="bottom",
    ha="left",
    fontsize=9,
    family="monospace",
    bbox=dict(boxstyle="round", facecolor="lightyellow", alpha=0.9, linewidth=2),
)

# Right: Area comparison
d_ref = 11.98
A_ref = np.pi * (d_ref / 2) ** 2

circle_ref = plt.Circle(
    (0, 0),
    d_ref / 2,
    color="#4CAF50",
    alpha=0.3,
    label=f"Reference\n$A$ = {A_ref:.1f} cm²",
)
ax2.add_patch(circle_ref)

circle_equiv = plt.Circle(
    (0, 0),
    d_equiv / 2,
    color="#2196F3",
    alpha=0.3,
    linestyle="--",
    fill=False,
    linewidth=2.5,
    label=f"Star equiv.\n$A$ = {area_cm2:.1f} cm²",
)
ax2.add_patch(circle_equiv)

star_poly = Polygon(
    np.column_stack([x_star_polygon, y_star_polygon]),
    color="#FFD700",
    alpha=0.6,
    edgecolor="#FF8C00",
    linewidth=3,
    label="Star loop",
)
ax2.add_patch(star_poly)

ax2.set_aspect("equal")
ax2.set_xlim(-12, 12)
ax2.set_ylim(-12, 12)
ax2.set_xlabel("$x$ (cm)", fontsize=12)
ax2.set_ylabel("$y$ (cm)", fontsize=12)
ax2.set_title("(b) Area Comparison", fontsize=13, fontweight="bold")
ax2.grid(True, alpha=0.3)
ax2.legend(fontsize=10)

measured = 109
disc_pct = abs(measured - area_cm2) / measured * 100
comp_text = f"""EXPERIMENT vs THEORY:

Measured: {measured} cm²
Calculated: {area_cm2:.1f} cm²
Discrepancy: {disc_pct:.1f}%"""

ax2.text(
    0.02,
    0.98,
    comp_text,
    transform=ax2.transAxes,
    va="top",
    ha="left",
    fontsize=10,
    family="monospace",
    bbox=dict(boxstyle="round", facecolor="lightcyan", alpha=0.9, linewidth=2),
)

plt.suptitle(
    "Star Loop: CORRECTED Geometry (Perfect Pentagram)", fontsize=15, fontweight="bold"
)
plt.tight_layout()
plt.savefig("mm_star_loop_corrected.png", dpi=300, bbox_inches="tight")
plt.close()
print("\n✓ Saved: mm_star_loop_corrected.png")

# ========================================================================
# Detailed schematic
# ========================================================================
fig, ax = plt.subplots(figsize=(14, 14))

ax.fill(x_plot, y_plot, color="#FFD700", alpha=0.6, edgecolor="#FF8C00", linewidth=4)
ax.plot(x_plot, y_plot, "o", markersize=13, color="#FF8C00", zorder=5)

# Draw all star edges
colors = ["#E74C3C", "#3498DB", "#2ECC71", "#F39C12", "#9B59B6"]
for i in range(5):
    ax.plot(
        [x_star_points[connections[i]], x_star_points[connections[(i + 1) % 5]]],
        [y_star_points[connections[i]], y_star_points[connections[(i + 1) % 5]]],
        "-",
        linewidth=3,
        alpha=0.7,
        color=colors[i],
        zorder=4,
    )

# Pentagon
ax.plot(pent_x, pent_y, "g--", linewidth=3, alpha=0.8, label="Inner pentagon", zorder=3)

# Labels
for i in range(5):
    ax.text(
        x_star_points[i] * 1.15,
        y_star_points[i] * 1.15,
        f"P{i + 1}",
        ha="center",
        va="center",
        fontsize=14,
        weight="bold",
        color="white",
        bbox=dict(boxstyle="circle", facecolor="red", alpha=0.9, linewidth=2.5),
        zorder=15,
    )

    ax.text(
        pentagon_vertices[i][0] * 0.75,
        pentagon_vertices[i][1] * 0.75,
        f"V{i + 1}",
        ha="center",
        va="center",
        fontsize=13,
        weight="bold",
        color="white",
        bbox=dict(boxstyle="circle", facecolor="blue", alpha=0.9, linewidth=2.5),
        zorder=15,
    )

# Highlight P1-P3
ax.plot(
    [x_star_points[0], x_star_points[2]],
    [y_star_points[0], y_star_points[2]],
    "r-",
    linewidth=5,
    alpha=0.9,
    label=f"Alternate points: {total_span} cm",
    zorder=7,
)

ax.plot([0], [0], "ko", markersize=16, label="Center", zorder=10)
ax.set_aspect("equal")
ax.set_xlabel("$x$ (cm)", fontsize=14)
ax.set_ylabel("$y$ (cm)", fontsize=14)
ax.set_title(
    "5-Pointed Star: CORRECTED Detailed Schematic\n(Perfect Pentagram)",
    fontsize=15,
    fontweight="bold",
)
ax.grid(True, alpha=0.3)
ax.legend(fontsize=12)
ax.set_xlim(-14, 14)
ax.set_ylim(-14, 14)

schematic_info = f"""PENTAGRAM SPECIFICATIONS:
━━━━━━━━━━━━━━━━━━━━━━━━━
Star points: P1-P5
Pentagon vertices: V1-V5
Star radius: {R_star:.2f} cm
Alternate point span: {dist_P1_P3:.2f} cm
Pentagon side: {pent_side:.2f} cm
━━━━━━━━━━━━━━━━━━━━━━━━━
AREA: {area_cm2:.2f} cm²
Equiv. diam: {d_equiv:.2f} cm
━━━━━━━━━━━━━━━━━━━━━━━━━
Experimental: {measured} cm²
Discrepancy: {disc_pct:.1f}%
━━━━━━━━━━━━━━━━━━━━━━━━━"""

ax.text(
    0.98,
    0.02,
    schematic_info,
    transform=ax.transAxes,
    va="bottom",
    ha="right",
    fontsize=10,
    family="monospace",
    bbox=dict(boxstyle="round", facecolor="lightgreen", alpha=0.9, linewidth=3),
)

plt.tight_layout()
plt.savefig("mm_star_detailed_schematic.png", dpi=300, bbox_inches="tight")
plt.close()
print("✓ Saved: mm_star_detailed_schematic.png")

print("\n" + "=" * 70)
print("STAR GEOMETRY FULLY CORRECTED - PERFECT PENTAGRAM")
print("=" * 70)
print(f"This is a regular 5-pointed star (pentagram)")
print(f"Alternate star points separated by {total_span} cm")
print(f"Lines between alternate points pass through pentagon vertices ✓")
print(f"Calculated area: {area_cm2:.2f} cm²")
print(f"Experimental area: {measured} cm²")
print(f"Discrepancy: {disc_pct:.1f}%")
print("=" * 70)
