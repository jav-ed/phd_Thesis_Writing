import numpy as np
import plotly.graph_objects as go
from plotly.subplots import make_subplots

from pathlib import Path

# Create a custom 1D multimodal function
def multimodal_1d(x):
    """
    Custom 1D multimodal function with multiple local extrema and one global minimum/maximum
    """
    return np.sin(x) * np.exp(-0.1 * x**2) + 0.2 * np.sin(3*x)

# Generate x values
x = np.linspace(-6, 6, 1000)
y = multimodal_1d(x)

# Find critical points using numerical methods
from scipy.signal import find_peaks

# Find maxima
peaks, _ = find_peaks(y)
maxima_x = x[peaks]
maxima_y = y[peaks]

# Find minima
troughs, _ = find_peaks(-y)
minima_x = x[troughs]
minima_y = y[troughs]

# Identify global extrema
global_max_idx = np.argmax(y[peaks])
global_min_idx = np.argmin(y[troughs])

# Create the figure
fig = go.Figure()

# Add main function curve
fig.add_trace(
    go.Scatter(
        x=x,
        y=y,
        mode='lines',
        name='f(x)',
        showlegend=True
    )
)

# Add local maxima
fig.add_trace(
    go.Scatter(
        x=np.delete(maxima_x, global_max_idx),
        y=np.delete(maxima_y, global_max_idx),
        mode='markers+text',
        name='Local Maximum',
        marker=dict(
            symbol='circle',
            size=12,
        ),
        text=['Local Max.' for i in range(len(np.delete(maxima_x, global_max_idx)))],
        textposition='top right',
        showlegend=True
    )
)

# Add local minima
fig.add_trace(
    go.Scatter(
        x=np.delete(minima_x, global_min_idx),
        y=np.delete(minima_y, global_min_idx),
        mode='markers+text',
        name='Local Minimum',
        marker=dict(
            symbol='circle',
            size=12,
        ),
        text=['Local Min.'  for i in range(len(np.delete(minima_x, global_min_idx)))],
        textposition='bottom left',
        showlegend=True
    )
)

# Add global maximum
fig.add_trace(
    go.Scatter(
        x=[maxima_x[global_max_idx]],
        y=[maxima_y[global_max_idx]],
        mode='markers+text',
        name='Global Maximum',
        marker=dict(
            symbol='diamond',
            size=14,
        ),
        text=['Global Max.'],
        textposition='top right',
        showlegend=True
    )
)

# Add global minimum
fig.add_trace(
    go.Scatter(
        x=[minima_x[global_min_idx]],
        y=[minima_y[global_min_idx]],
        mode='markers+text',
        name='Global Minimum',
        marker=dict(
            symbol='diamond',
            size=14,
        ),
        text=['Global Min.' for i in range(len([minima_x[global_min_idx]]))],
        textposition='bottom left',
        showlegend=True
    )
)

# Update layout for publication quality
fig.update_layout(
    title=dict(
        # text='One-Dimensional Multimodal Function',
        x=0.5,
        y=0.95,
        font=dict(size=16)
    ),
    width=800,
    height=500,
    xaxis=dict(
        title='x',
        showgrid=True
    ),
    yaxis=dict(
        title='f(x)',
        showgrid=True
    ),
    font=dict(
        family="Computer Modern",
        size=15
    ),
    margin=dict(l=0, r=0, t=0, b=0),
)



# ============================================================================ #
# ================================ border_less =============================== #
# ============================================================================ #
def border_less(fig):

    chosen_text_size = 15
    # chosen_font = "CMU Serif"
    chosen_font = "New Computer Modern"
    legend_title_size = chosen_text_size
    # legend_entry_size = chosen_text_size-2
    legend_entry_size = chosen_text_size


    fig.update_layout(
        # would remove the desired helping rectangulars
        # plot_bgcolor='rgba(0,0,0,0)',  # Transparent background

        paper_bgcolor='rgba(0,0,0,0)',  # Transparent paper
        margin=dict(l=0, r=0, t=20, b=0),  # Remove margins

        title = None,
        # textfont = dict(size=15,family = "CMU Serif"),
        font = dict(
            size=chosen_text_size,
            family = chosen_font
        ),

        xaxis=dict(
            showline=True,
            showgrid=True,
            showticklabels=True,
            linewidth=2,
            tickfont=dict(family=chosen_font, size=chosen_text_size),
            title_font=dict(size=chosen_text_size,family = chosen_font),

        ),

        yaxis=dict(
            showline=True,
            showgrid=True,
            showticklabels=True,
            linewidth=2,
            tickfont=dict(size=chosen_text_size,family = chosen_font),
            title_font=dict(size=chosen_text_size,family = chosen_font),
        ),

        legend=dict(
            font=dict(family=chosen_font, size=legend_entry_size),
            title=dict(font=dict(family=chosen_font, size=legend_title_size)),
            tracegroupgap=30,  # Added this to maintain group spacing,
        ),



    )

        # Update text size for all traces
    for trace in fig.data:
        if isinstance(trace, go.Scatter):
            trace.textfont.update(size=chosen_text_size, family=chosen_font)

    return fig


fig = border_less(fig)
fig.update_layout(
        width=900,
        height=500,
)



cwd = Path.cwd()
output_fold = cwd / "1_Data/2_Figs/0_Content/1_Chap/3_Optimization/3_Opti_Basics"


# Save the plot as SVG
fig.write_image(output_fold/"0_Multi_Modal.svg")