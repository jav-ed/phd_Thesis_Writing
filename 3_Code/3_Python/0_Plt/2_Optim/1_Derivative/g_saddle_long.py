import numpy as np
import sympy as sp
import plotly.graph_objects as go
from plotly.subplots import make_subplots
from pathlib import Path
from sympy import symbols, diff, sympify

def analyze_1d_function(expr_str):
    """
    Analyzes critical points of a 1D function.
    
    Parameters:
    expr_str (str): String representation of the function in terms of x
    
    Returns:
    list: List of dictionaries containing critical points and their classification
    """
    # Create symbol and convert expression
    x = symbols('x')
    expr = sympify(expr_str)
    
    # Calculate first and second derivatives
    first_deriv = diff(expr, x)
    second_deriv = diff(first_deriv, x)
    
    # Find critical points by solving first derivative = 0
    from sympy import solve
    critical_points = solve(first_deriv, x)
    
    results = []
    
    for point in critical_points:
        # Evaluate second derivative at critical point
        second_deriv_value = second_deriv.subs(x, point)
        
        # Classify the point
        if second_deriv_value > 0:
            classification = "Local minimum"
        elif second_deriv_value < 0:
            classification = "Local maximum"
        else:
            classification = "Inflection point"
            
        results.append({
            'x': float(point),
            'classification': classification,
            'second_derivative': float(second_deriv_value)
        })
    
    return results

# Example usage function
def analyze_1d_example(expr_str):
    """
    Wrapper function to analyze and print results in a readable format
    """
    print(f"Analysis of function: {expr_str}")
    print("=" * 40)
    
    results = analyze_1d_function(expr_str)
    
    for i, result in enumerate(results, 1):
        print(f"\nCritical Point {i}:")
        print(f"x = {result['x']}")
        print(f"Classification: {result['classification']}")
        
def get_derivatives(expr_str, var_name='x', num_derivatives=2):
    """
    Generate symbolic derivatives of a given expression.
    """
    x = sp.Symbol(var_name)
    expr = sp.sympify(expr_str)
    
    # Create lambda function for original expression
    f = sp.lambdify(x, expr, modules=['numpy'])
    
    # Calculate derivatives
    derivatives = []
    current_expr = expr
    for _ in range(num_derivatives):
        current_expr = sp.diff(current_expr, x)
        derivative_func = sp.lambdify(x, current_expr, modules=['numpy'])
        derivatives.append(derivative_func)
    
    return f, derivatives

def border_less(fig):
    chosen_text_size = 15
    chosen_font = "New Computer Modern"
    legend_title_size = chosen_text_size
    legend_entry_size = chosen_text_size

    fig.update_layout(
        paper_bgcolor='rgba(0,0,0,0)',
        margin=dict(l=0, r=0, t=20, b=0),
        title=None,
        font=dict(
            size=chosen_text_size,
            family=chosen_font
        ),
        legend=dict(
            font=dict(family=chosen_font, size=legend_entry_size),
            title=dict(font=dict(family=chosen_font, size=legend_title_size)),
            itemsizing='constant',
            tracegroupgap=30
        ),
    )

    # Update all axes fonts
    for axis in fig.layout:
        if axis.startswith('xaxis') or axis.startswith('yaxis'):
            fig.layout[axis].update(
                tickfont=dict(family=chosen_font, size=chosen_text_size),
                title_font=dict(family=chosen_font, size=chosen_text_size)
            )

    # Update subplot titles
    for annotation in fig.layout.annotations:
        annotation.update(
            font=dict(family=chosen_font, size=chosen_text_size)
        )

    return fig

def plot_function_analysis(expr_str, x_range=(-3, 3), num_points=1000):
    """
    Create a detailed plot of a function and its derivatives with custom styling.
    """
    # Generate x values
    x = np.linspace(x_range[0], x_range[1], num_points)
    
    # Get function and derivatives
    f, derivatives = get_derivatives(expr_str)
    
    # Calculate y values
    y = f(x)
    dy = derivatives[0](x)
    d2y = derivatives[1](x)
    
    # Create subplots
    fig = make_subplots(
        rows=3, cols=1,
        subplot_titles=('Original Function f(x)', 'First Derivative f\'(x)', 'Second Derivative f\'\'(x)'),
        vertical_spacing=0.1
    )

    # Add main function curve
    fig.add_trace(
        go.Scatter(
            x=x, y=y,
            mode='lines',
            name='f(x)',
            line=dict(color='#1f77b4', width=3),
            showlegend=True
        ),
        row=1, col=1
    )

    # Add first derivative
    fig.add_trace(
        go.Scatter(
            x=x, y=dy,
            mode='lines',
            name='f\'(x)',
            line=dict(color='#ff7f0e', width=3),
            showlegend=True
        ),
        row=2, col=1
    )

    # Add second derivative
    fig.add_trace(
        go.Scatter(
            x=x, y=d2y,
            mode='lines',
            name='f\'\'(x)',
            line=dict(color='#2ca02c', width=3),
            showlegend=True
        ),
        row=3, col=1
    )

    # Update layout
    fig.update_layout(
        width=900,
        height=900,
        showlegend=True,
        font=dict(
            family="Computer Modern",
            size=15
        )
    )

    # Update axes for all subplots
    for i in range(1, 4):
        fig.update_xaxes(
            title='x',
            showgrid=True,
            zeroline=True,
            zerolinewidth=2,
            row=i, col=1
        )
                
        fig.update_yaxes(
            showgrid=True,
            zeroline=True,
            zerolinewidth=2,
            row=i, col=1
        )

    # Apply borderless style
    fig = border_less(fig)
    
    return fig

# Example usage
if __name__ == "__main__":
    # expr = "sin(x) * exp(-0.1 * x**2) + 0.2 * sin(3*x)"
    # expr = "x+sin(x)"   # yes
    # expr = "x**5"       # yes
    # expr = "(x-1)**3"     #yes
    expr = "-(2/3) * x**3 + 2 * x**2 - 2 * x + 2" #yes
    # expr = "x**4" # no saddle point
    # expr = "1/4 * (-x**4 + 12* x**3 - 54 * x**2 + 112 *x -69)" #yes

    fig = plot_function_analysis(expr, (-6,6))
    
    # analyze_1d_example(expr)
        

    
    # Show the plot
    fig.show()
    
    # Optional: Save the plot
    # cwd = Path.cwd()
    # output_fold = cwd / "1_Data/2_Figs/0_Content/1_Chap/3_Optimization/3_Opti_Basics"
    # fig.write_image(output_fold/"1_Saddle_with_derivatives.svg")