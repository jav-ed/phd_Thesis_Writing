import numpy as np
import sympy as sp
import plotly.graph_objects as go
from plotly.subplots import make_subplots
from scipy.optimize import fsolve

# Define the symbolic variable and function
x = sp.Symbol('x')
f = sp.sin(x) * sp.exp(-0.1 * x**2) + 0.2 * sp.sin(3*x)

# Calculate first and second derivatives
f_prime = sp.diff(f, x)
f_double_prime = sp.diff(f_prime, x)

# Convert symbolic expressions to numerical functions
f_lambda = sp.lambdify(x, f, 'numpy')
f_prime_lambda = sp.lambdify(x, f_prime, 'numpy')
f_double_prime_lambda = sp.lambdify(x, f_double_prime, 'numpy')

# Function to find zeros of f'(x)
def find_extrema(x_range):
    x_guesses = np.linspace(x_range[0], x_range[1], 20)
    extrema = []
    
    for guess in x_guesses:
        root = fsolve(f_prime_lambda, guess)
        if (x_range[0] <= root <= x_range[1] and 
            not any(abs(r - root) < 1e-6 for r in extrema)):
            extrema.append(float(root))
    
    return np.array(sorted(extrema))

# Function to find zeros of f''(x) (inflection points)
def find_inflection_points(x_range):
    x_guesses = np.linspace(x_range[0], x_range[1], 20)
    inflections = []
    
    for guess in x_guesses:
        root = fsolve(f_double_prime_lambda, guess)
        if (x_range[0] <= root <= x_range[1] and 
            not any(abs(r - root) < 1e-6 for r in inflections)):
            inflections.append(float(root))
    
    return np.array(sorted(inflections))

# Find extrema points
x_range = [-6, 6]
extrema_x = find_extrema(x_range)
extrema_y = f_lambda(extrema_x)
extrema_derivative_y = f_prime_lambda(extrema_x)

# Find inflection points
inflection_x = find_inflection_points(x_range)
inflection_y = f_prime_lambda(inflection_x)
inflection_second_derivative_y = f_double_prime_lambda(inflection_x)

# Classify extrema points using second derivative
second_deriv_values = f_double_prime_lambda(extrema_x)
maxima_x = extrema_x[second_deriv_values < 0]
maxima_y = f_lambda(maxima_x)
minima_x = extrema_x[second_deriv_values > 0]
minima_y = f_lambda(minima_x)

# Find global extrema
global_max_x = maxima_x[np.argmax(maxima_y)] if len(maxima_y) > 0 else None
global_min_x = minima_x[np.argmin(minima_y)] if len(minima_y) > 0 else None

# Create x values for plotting
x_vals = np.linspace(-6, 6, 1000)

# Create the subplot figure
fig = make_subplots(rows=3, cols=1,
                    subplot_titles=('Original Function with Extrema',
                                  'First Derivative (zeros indicate extrema)',
                                  'Second Derivative (sign determines min/max)'))

# Add traces for original function and extrema points (same as before)
fig.add_trace(
    go.Scatter(x=x_vals, y=f_lambda(x_vals),
               name='f(x)', line=dict(color='blue')),
    row=1, col=1
)

# Add extrema points to first plot
fig.add_trace(
    go.Scatter(x=maxima_x, y=maxima_y,
               name='Local Maxima',
               mode='markers',
               marker=dict(color='red', size=10, symbol='triangle-up')),
    row=1, col=1
)

fig.add_trace(
    go.Scatter(x=minima_x, y=minima_y,
               name='Local Minima',
               mode='markers',
               marker=dict(color='green', size=10, symbol='triangle-down')),
    row=1, col=1
)

# Add global extrema
if global_max_x is not None:
    fig.add_trace(
        go.Scatter(x=[global_max_x], y=[f_lambda(global_max_x)],
                   name='Global Maximum',
                   mode='markers',
                   marker=dict(color='darkred', size=15, symbol='star')),
        row=1, col=1
    )

if global_min_x is not None:
    fig.add_trace(
        go.Scatter(x=[global_min_x], y=[f_lambda(global_min_x)],
                   name='Global Minimum',
                   mode='markers',
                   marker=dict(color='darkgreen', size=15, symbol='star')),
        row=1, col=1
    )

# Add first derivative with annotations
fig.add_trace(
    go.Scatter(x=x_vals, y=f_prime_lambda(x_vals),
               name="f'(x)", line=dict(color='red')),
    row=2, col=1
)

# Add second derivative with annotations
fig.add_trace(
    go.Scatter(x=x_vals, y=f_double_prime_lambda(x_vals),
               name='f"(x)', line=dict(color='green')),
    row=3, col=1
)

# Add zero lines
for row in [2, 3]:
    fig.add_trace(
        go.Scatter(x=x_vals, y=np.zeros_like(x_vals),
                   name='y=0', line=dict(color='black', dash='dash'),
                   showlegend=False),
        row=row, col=1
    )

# Add annotations for extrema points on first derivative plot
for x, y in zip(extrema_x, extrema_derivative_y):
    fig.add_annotation(
        x=x, y=y,
        text=f"Zero at x={x:.2f}<br>Extremum",
        showarrow=True,
        arrowhead=1,
        row=2, col=1
    )

# Add annotations for inflection points on second derivative plot
for x, y in zip(inflection_x, inflection_second_derivative_y):
    fig.add_annotation(
        x=x, y=y,
        text=f"Zero at x={x:.2f}<br>Inflection point",
        showarrow=True,
        arrowhead=1,
        row=3, col=1
    )

# Update layout
fig.update_layout(
    height=900,
    title_text="Function and its Derivatives with Annotations",
    showlegend=True
)

# Update axes labels
fig.update_xaxes(title_text="x")
fig.update_yaxes(title_text="y")

# Show the plot
fig.show()

# Print the points
print("\nExtrema points (x, f(x)):")
for x, y in zip(extrema_x, f_lambda(extrema_x)):
    print(f"({x:.3f}, {y:.3f})")

print("\nInflection points (x, f(x)):")
for x in inflection_x:
    print(f"({x:.3f}, {f_lambda(x):.3f})")