import numpy as np
import plotly.graph_objects as go
from plotly.subplots import make_subplots
from pathlib import Path

# Generate x values from 0 to 4π
x = np.linspace(0, 4*np.pi, 1000)
y = np.sin(x)
dy = np.cos(x)  # First derivative
d2y = -np.sin(x)  # Second derivative

# Calculate maxima and minima positions
max_x = np.array([np.pi/2, 5*np.pi/2])
min_x = np.array([3*np.pi/2, 7*np.pi/2])
max_y = np.sin(max_x)
min_y = np.sin(min_x)

# Create subplots
fig = make_subplots(rows=3, cols=1,
                    subplot_titles=('Function: sin(x)', 
                                  'First Derivative: cos(x)', 
                                  'Second Derivative: -sin(x)'),
                    vertical_spacing=0.08)

# Add main sine curve
fig.add_trace(
    go.Scatter(x=x, y=y, name='sin(x)', 
               line=dict(color='#1f77b4', width=2),
               legendgroup="group1",
               legendgrouptitle_text="Original Function",
               hovertemplate='x: %{x:.2f}<br>y: %{y:.2f}<extra></extra>'),
    row=1, col=1
)

# Add markers for maxima with updated text
fig.add_trace(
    go.Scatter(
        x=max_x, y=max_y,
        mode='markers+text',
        name='Global & Local Maximum',
        legendgroup="group1",
        marker=dict(size=10, color='#2ca02c', symbol='circle'),
        text=['Global Maximum (y=1)', 'Global Maximum (y=1)'],
        textposition='top center',
        hovertemplate='x: %{x:.2f}π<br>Global Maximum: y=1<extra></extra>'
    ),
    row=1, col=1
)

# Add markers for minima with updated text
fig.add_trace(
    go.Scatter(
        x=min_x, y=min_y,
        mode='markers+text',
        name='Global & Local Minimum',
        legendgroup="group1",
        marker=dict(size=10, color='#d62728', symbol='circle'),
        text=['Global Minimum (y=-1)', 'Global Minimum (y=-1)'],
        textposition='bottom center',
        hovertemplate='x: %{x:.2f}π<br>Global Minimum: y=-1<extra></extra>'
    ),
    row=1, col=1
)

# Add first derivative
fig.add_trace(
    go.Scatter(x=x, y=dy, name='cos(x)', 
               line=dict(color='#ff7f0e', width=2),
               legendgroup="group2",
               legendgrouptitle_text="First Derivative",
               hovertemplate='x: %{x:.2f}<br>y: %{y:.2f}<extra></extra>'),
    row=2, col=1
)

# Add zero points on first derivative
fig.add_trace(
    go.Scatter(
        x=np.concatenate([max_x, min_x]),
        y=np.zeros_like(np.concatenate([max_x, min_x])),
        mode='markers',
        name='f\'(x) = 0',
        legendgroup="group2",
        marker=dict(size=10, color='#9467bd', symbol='circle'),
        hovertemplate='x: %{x:.2f}π<br>f\'(x) = 0<extra></extra>'
    ),
    row=2, col=1
)

# Add second derivative
fig.add_trace(
    go.Scatter(x=x, y=d2y, name='-sin(x)', 
               line=dict(color='#2ca02c', width=2),
               legendgroup="group3",
               legendgrouptitle_text="Second Derivative",
               hovertemplate='x: %{x:.2f}<br>y: %{y:.2f}<extra></extra>'),
    row=3, col=1
)

# Add concavity indicators
fig.add_trace(
    go.Scatter(
        x=max_x, y=-np.ones_like(max_x),
        mode='markers',
        name='f\'\'(x) < 0 at Maximum',
        legendgroup="group3",
        marker=dict(size=10, color='#2ca02c', symbol='circle'),
        hovertemplate='x: %{x:.2f}π<br>Concave Down at Maximum<extra></extra>'
    ),
    row=3, col=1
)

fig.add_trace(
    go.Scatter(
        x=min_x, y=np.ones_like(min_x),
        mode='markers',
        name='f\'\'(x) > 0 at Minimum',
        legendgroup="group3",
        marker=dict(size=10, color='#d62728', symbol='circle'),
        hovertemplate='x: %{x:.2f}π<br>Concave Up at Minimum<extra></extra>'
    ),
    row=3, col=1
)

# Update layout
fig.update_layout(
    height=900,
    width=900,
    showlegend=True,
    title_text='Sine Function and its Derivatives',
    legend=dict(
        tracegroupgap=30  # Add more space between legend groups
    )
)

# Update axes
for i in range(1, 4):
    fig.update_xaxes(
        tickmode='array',
        ticktext=['0', 'π/2', 'π', '3π/2', '2π', '5π/2', '3π', '7π/2', '4π'],
        tickvals=[0, np.pi/2, np.pi, 3*np.pi/2, 2*np.pi, 5*np.pi/2, 3*np.pi, 7*np.pi/2, 4*np.pi],
        zeroline=True,
        zerolinewidth=2,
        row=i, col=1
    )
    fig.update_yaxes(
        zeroline=True,
        zerolinewidth=2,
        range=[-1.5, 1.5],
        row=i, col=1
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
            tracegroupgap=30  # Added this to maintain group spacing
        ),



    )

        # Update text size for all traces
    for trace in fig.data:
        if isinstance(trace, go.Scatter):
            trace.textfont.update(size=chosen_text_size, family=chosen_font)

    return fig


fig = border_less(fig)

# Show the plot
# fig.show()


cwd = Path.cwd()
# output_fold = cwd / "1_Data/2_Figs/2_Code_Created"
output_fold = cwd / "1_Data/2_Figs/0_Content/1_Chap/3_Optimization/3_Opti_Basics"


# Save the plot as SVG
fig.write_image(output_fold/"1_Sin_Opti.svg")

# Optional: Save the plot
# fig.write_html("trig_visualization.html")
# fig.write_image("trig_visualization.pdf")  # Requires kaleido package