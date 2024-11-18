from pathlib import Path
import numpy as np
import plotly.graph_objects as go
from plotly.subplots import make_subplots


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
        margin=dict(l=0, r=0, t=0, b=0),  # Remove margins

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
        ),



    )

        # Update text size for all traces
    for trace in fig.data:
        if isinstance(trace, go.Scatter):
            trace.textfont.update(size=chosen_text_size, family=chosen_font)

    return fig




cwd = Path.cwd()
# output_fold = cwd / "1_Data/2_Figs/2_Code_Created"
output_fold = cwd / "1_Data/2_Figs/0_Content/1_Chap/1_Hydro/0_Intro"

# Data
systems = ['GH2\n(350 bar)', 'GH2\n(700 bar)', 'LH2\n(2 bar)', 'Solid\nStorage MH', 'Li Ion\nBattery', 'CNG\n(200 bar)', 'LNG', 'Gasoline']
pure_values = [33.3, 33.3, 33.3, 0, 0, 13.9, 13.9, 11.5]
system_values = [1.6, 1.8, 2, 0.4, 0.15, 3.8, 7.4, 8]

# Create stacked bar chart
fig = go.Figure()

# Add pure values (top of the stack)
fig.add_trace(go.Bar(
    x=systems,
    y=pure_values,
    name='Gravimetric Energy \nDensity Pure',
    marker_color='rgb(158,202,225)',
    textposition='auto',
    text=pure_values,
    texttemplate='%{y:.1f}'
))

# Add system values (bottom of the stack)
fig.add_trace(go.Bar(
    x=systems,
    y=system_values,
    name='Gravimetric Energy \nDensity System',
    marker_color='rgb(255,192,0)',
    textposition='auto',
    text=system_values,
    texttemplate='%{y:.1f}'

))

# Update layout
fig.update_layout(
    title='Gravimetric Energy Densities of \nStorage Systems',
    xaxis_title='Storage Systems',
    yaxis_title='Gravimetric Energy Density [kWh/kg]',
    # barmode='stack',
    barmode='group',
    legend=dict(
        orientation='h',
        yanchor='bottom',
        y=1.02,
        xanchor='right',
        x=1,
        entrywidth=300,  
    ),
    # margin=dict(t=100)
)


# Customize y-axis
fig.update_yaxes(range=[0, 35], dtick=2)

fig = border_less(fig)

fig.update_layout(
        width=900,
        height=500,
)

fig.show()

# Save the plot as SVG
fig.write_image(output_fold/"1_H2_densities.svg")

# Uncomment the next line if you want to display the plot