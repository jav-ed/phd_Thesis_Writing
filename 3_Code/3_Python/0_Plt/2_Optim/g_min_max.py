import plotly.graph_objects as go
import numpy as np
from pathlib import Path


# Generate data starting from 0
x = np.linspace(0, 5, 100)
y = 2*x + 3  # Linear function
y_neg = -y   # Negative of the function

# Create figure
fig = go.Figure()

# Add original function
fig.add_trace(go.Scatter(
    x=x, y=y,
    name='f(x)',
))

# Add negative function
fig.add_trace(go.Scatter(
    x=x, y=y_neg,
    name='-f(x)',
))

# Add annotations for minimum and maximum
fig.add_annotation(
    x=0, y=3,
    text='min f(x)',
    showarrow=True,
    arrowhead=1,
    ax=30,
    ay=-30
)

fig.add_annotation(
    x=0, y=-3,
    text='max -f(x)',
    showarrow=True,
    arrowhead=1,
    ax=30,
    ay=30
)

# Update layout
fig.update_layout(
    title='Function and its Negative',
    xaxis_title='x',
    yaxis_title='f(x); -f(x)',
    xaxis=dict(range=[-2, 7]),  # Set x-axis range from -2 to 7
    yaxis=dict(range=[y_neg.min()-3, y.max()+3]),  # Set x-axis range from -2 to 7
    showlegend=True,
    width=900,
    height=500
)


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

fig = border_less(fig)

# Optional: Save the plot
cwd = Path.cwd()
output_fold = cwd / "1_Data/2_Figs/0_Content/1_Chap/3_Optimization/3_Opti_Basics"
fig.write_image(output_fold/"4_Min_Max_Sym.svg")

