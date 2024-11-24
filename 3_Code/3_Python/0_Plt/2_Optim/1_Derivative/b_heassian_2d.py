import sympy as sp
import numpy as np
import plotly.graph_objects as go
from plotly.subplots import make_subplots

# Define the variables and function
x1, x2 = sp.symbols('x1 x2')
f = 0.5*x1**4 + 2*x1**3 + 1.5*x1**2 + x2**2 - 2*x1*x2

# Calculate gradient
gradient = [sp.diff(f, var) for var in (x1, x2)]
print("Gradient:")
print(f"∂f/∂x1 = {gradient[0]}")
print(f"∂f/∂x2 = {gradient[1]}")

# Calculate Hessian
hessian = sp.Matrix([[sp.diff(f, var1, var2) for var2 in (x1, x2)] for var1 in (x1, x2)])
print("\nHessian:")
print(hessian)

# Solve for critical points
critical_points = sp.solve(gradient, (x1, x2))
print("\nCritical points:", critical_points)

# Function to evaluate eigenvalues at a point
def evaluate_eigenvalues(point):
    hessian_at_point = hessian.subs([(x1, point[0]), (x2, point[1])])
    eigenvals = [complex(e) for e in hessian_at_point.eigenvals().keys()]
    return eigenvals

# Classify critical points
def classify_point(point):
    eigenvals = evaluate_eigenvalues(point)
    real_eigenvals = [e.real for e in eigenvals]
    
    if all(e > 0 for e in real_eigenvals):
        return "Local minimum"
    elif all(e < 0 for e in real_eigenvals):
        return "Local maximum"
    else:
        return "Saddle point"

# Create 3D surface plot with critical points
def plot_function():
    x1_range = np.linspace(-3, 3, 100)
    x2_range = np.linspace(-3, 3, 100)
    X1, X2 = np.meshgrid(x1_range, x2_range)
    
    # Convert symbolic function to numpy function
    f_lambda = sp.lambdify((x1, x2), f, "numpy")
    Z = f_lambda(X1, X2)
    
    # Create 3D surface plot
    fig = go.Figure(data=[go.Surface(x=X1, y=X2, z=Z, colorscale='viridis')])
    
    # Add critical points
    for point in critical_points:
        point_type = classify_point(point)
        x1_val, x2_val = float(point[0]), float(point[1])
        z_val = float(f.subs([(x1, x1_val), (x2, x2_val)]))
        
        color_map = {
            "Local minimum": "red",
            "Local maximum": "blue",
            "Saddle point": "yellow"
        }
        
        fig.add_scatter3d(
            x=[x1_val],
            y=[x2_val],
            z=[z_val],
            mode='markers',
            marker=dict(size=8, color=color_map[point_type]),
            name=f"{point_type} at ({x1_val:.2f}, {x2_val:.2f})"
        )
    
    fig.update_layout(
        title='Function Surface with Critical Points',
        scene=dict(
            xaxis_title='x1',
            yaxis_title='x2',
            zaxis_title='f(x1, x2)'
        )
    )
    
    return fig

# Execute the analysis
print("\nClassification of critical points:")
for point in critical_points:
    point_type = classify_point(point)
    print(f"Point {point}: {point_type}")

# Generate the plot
fig = plot_function()
fig.show()