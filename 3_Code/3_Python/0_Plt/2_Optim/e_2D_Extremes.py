import numpy as np
import sympy as sp
import plotly.graph_objects as go
from plotly.subplots import make_subplots
from typing import Tuple, Dict, List

from pathlib import Path

def compute_hessian(expr: str, vars: list = ['x', 'y']) -> Tuple[sp.Matrix, list]:
    """
    Compute the Hessian matrix for a given expression.
    """
    symbols = [sp.Symbol(var) for var in vars]
    f = sp.sympify(expr)
    first_derivs = [sp.diff(f, var) for var in symbols]
    hessian = sp.Matrix([[sp.diff(fd, var) for var in symbols] 
                        for fd in first_derivs])
    return hessian, symbols

def check_definiteness(hessian: sp.Matrix, point: list = None) -> str:
    """
    Check the definiteness of a Hessian matrix at a given point.
    """
    if point is not None:
        h_eval = np.array(hessian.subs([(sym, val) 
                         for sym, val in zip(hessian.free_symbols, point)])).astype(float)
    else:
        h_eval = np.array(hessian).astype(float)
    
    eigenvals = np.linalg.eigvals(h_eval)
    
    if all(ev > 0 for ev in eigenvals):
        return "Positive Definite"
    elif all(ev >= 0 for ev in eigenvals) and any(ev == 0 for ev in eigenvals):
        return "Positive Semidefinite"
    elif all(ev < 0 for ev in eigenvals):
        return "Negative Definite"
    elif all(ev <= 0 for ev in eigenvals) and any(ev == 0 for ev in eigenvals):
        return "Negative Semidefinite"
    else:
        return "Indefinite"

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


def create_surface_trace(expr: str, points: int = 50):
    """Create a surface trace with projected contours."""
    x = np.linspace(-2, 2, points)
    y = np.linspace(-2, 2, points)
    X, Y = np.meshgrid(x, y)
    
    # Convert expression to numpy function
    f = sp.lambdify(['x', 'y'], sp.sympify(expr))
    Z = f(X, Y)
    
    return go.Surface(
        x=X, y=Y, z=Z,
        # colorscale='Blues',
        showscale=False,
        contours_z=dict(
            show=True,
            usecolormap=True,
            project_z=True,
            highlightcolor="black",
            # width=0.5
        )
    )

def analyze_functions_with_subplots(functions):
    n_funcs = len(functions)
    n_cols = min(2, n_funcs)
    n_rows = (n_funcs + 1) // 2
    
    point_types = {
        "Positive Definite": "Minimum",
        "Positive Semidefinite": "Weak Minima Line",
        "Indefinite": "Saddle Point",
        "Negative Definite": "Maximum"
        }

    fig = make_subplots(
        rows=n_rows, cols=n_cols,
        subplot_titles=list(point_types.values()),  # bottom titles
        specs=[[{'type': 'scene'}] * n_cols] * n_rows,
        vertical_spacing=0.08,
        # horizontal_spacing=0.01
    )

    
    for idx, (desc, expr) in enumerate(functions.items()):
        row = idx // n_cols + 1
        col = idx % n_cols + 1
        
        surface = create_surface_trace(expr)
        fig.add_trace(surface, row=row, col=col)
        
        # Update 3D scene
        scene_key = f'scene{idx + 1}'
        fig.layout[scene_key].update(
            camera=dict(eye=dict(x=1.87, y=0.88, z=0.64)),
            xaxis=dict(showgrid=False, zeroline=False, showticklabels=False, showspikes=False, title="", showbackground=False),
            yaxis=dict(showgrid=False, zeroline=False, showticklabels=False, showspikes=False, title="", showbackground=False),
            zaxis=dict(showgrid=False, zeroline=False, showticklabels=False, showspikes=False, title="", showbackground=False),
        )
        
        fig.layout.annotations[idx].text = f"{desc} ({point_types[desc]})"
    
    fig = border_less(fig)
    
    fig.update_layout(
        height=300*n_rows,
        width=800,
        showlegend=False,
        scene=dict(bgcolor='rgba(0,0,0,0)',),
        paper_bgcolor='rgba(0,0,0,0)'
    )
    
    return fig



# Example usage
test_functions = {
    "Positive Definite": "x**2 + y**2",
    "Positive Semidefinite": "x**2",
    "Indefinite": "x**2 - y**2",
    "Negative Definite": "-(x**2 + y**2)"
}

fig = analyze_functions_with_subplots(test_functions)
# fig.show()

cwd = Path.cwd()
# output_fold = cwd / "1_Data/2_Figs/2_Code_Created"
output_fold = cwd / "1_Data/2_Figs/0_Content/1_Chap/3_Optimization/3_Opti_Basics"

# Save the plot as SVG
fig.write_image(output_fold/"3_2D_Extremes.svg")