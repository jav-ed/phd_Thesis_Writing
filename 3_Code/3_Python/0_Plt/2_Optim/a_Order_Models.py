import numpy as np
import plotly.graph_objects as go
from plotly.subplots import make_subplots
from sklearn.linear_model import LinearRegression
from sklearn.preprocessing import PolynomialFeatures
from sklearn.pipeline import make_pipeline
from pathlib import Path



# ============================================================================ #
# ================================ border_less =============================== #
# ============================================================================ #
def border_less(fig):
    chosen_text_size = 15
    chosen_font = "New Computer Modern"
    legend_title_size = chosen_text_size
    legend_entry_size = chosen_text_size

    fig.update_layout(
        paper_bgcolor='rgba(0,0,0,0)',
        margin=dict(l=0, r=0, t=0, b=0),
        title=None,
        font=dict(size=chosen_text_size, family=chosen_font),
        legend=dict(
            font=dict(family=chosen_font, size=legend_entry_size),
            title=dict(font=dict(family=chosen_font, size=legend_title_size)),
        )
    )
    
    # Update subplot titles separately
    for annotation in fig.layout.annotations:
        annotation.update(font=dict(size=chosen_text_size, family=chosen_font))
        
    for trace in fig.data:
        if isinstance(trace, go.Scatter):
            trace.textfont.update(size=chosen_text_size, family=chosen_font)

    return fig

# ---------------------------------------------------------------------------- #

val_Tr_start = 2
val_Tr_end = 8

val_left = -2
val_right = 12

# Generate training data
np.random.seed(42)
X_train = np.linspace(val_Tr_start, val_Tr_end, 10).reshape(-1, 1)
y_train = 2*X_train + 1 + np.random.normal(0, 2, X_train.shape)  # Reduced noise

# Fit models
linear_model = LinearRegression()
poly_model = make_pipeline(PolynomialFeatures(4), LinearRegression())

linear_model.fit(X_train, y_train)
poly_model.fit(X_train, y_train)

# Generate points for plotting with wider range
X_full = np.linspace(val_left, val_right, 200).reshape(-1, 1)  # Extended range
linear_pred = linear_model.predict(X_full)
poly_pred = poly_model.predict(X_full)

# Create subplots
fig = make_subplots(rows=1, cols=2, 
                    subplot_titles=('Training Phase', 
                                    'Testing Phase (with Extrapolation)'))

# Training phase plot (zoomed in)

# plot training data
fig.add_trace(
    go.Scatter(x=X_train.flatten(), y=y_train.flatten(), mode='markers', 
               name='Training Data', marker=dict(color='#4A90E2', size=8)),
    row=1, col=1
)

# plot linear model on training data
fig.add_trace(
    go.Scatter(x=X_train.flatten(), y=linear_model.predict(X_train).flatten(),
               mode='lines', name='Linear Model', line=dict(color='#FF4444', width=2)),
    row=1, col=1
)

# plot polynomial model on training data
fig.add_trace(
    go.Scatter(x=X_train.flatten(), y=poly_model.predict(X_train).flatten(),
               mode='lines', name='4th Degree Polynomial', line=dict(color='#44AA44', width=2)),
    row=1, col=1
)

# ------------------ Testing phase plot (with extrapolation) ----------------- #
fig.add_trace(
    go.Scatter(x=X_train.flatten(), y=y_train.flatten(), mode='markers',
               name='Training Data', showlegend=False, marker=dict(color='#4A90E2', size=8)),
    row=1, col=2
)

# full data linear model
fig.add_trace(
    go.Scatter(x=X_full.flatten(), y=linear_pred.flatten(), mode='lines',
               name='Linear Model', showlegend=False, line=dict(color='#FF4444', width=2)),
    row=1, col=2
)

# full data polynomial model
fig.add_trace(
    go.Scatter(x=X_full.flatten(), y=poly_pred.flatten(), mode='lines',
               name='4th Degree Polynomial', showlegend=False, line=dict(color='#44AA44', width=2)),
    row=1, col=2
)

# --------------------- Add extrapolation region shading --------------------- #
fig.add_vrect(x0=val_left, x1=val_Tr_start, fillcolor="#FF9500", opacity=0.1, line_width=0, row=1, col=2)
fig.add_vrect(x0=val_Tr_end, x1=val_right, fillcolor="#FF9500", opacity=0.1, line_width=0, row=1, col=2)



# Update layout
fig.update_layout(
    showlegend=True,
    title_text="Linear vs Non-linear Regression Comparison",
    title_x=0.5,
    template="plotly_white"
)

# Update axes labels and ranges
fig.update_xaxes(title_text="Input Variable", row=1, col=1, range=[val_Tr_start-1, val_Tr_end+1])
fig.update_xaxes(title_text="Input Variable", row=1, col=2, range=[val_left, val_right])
fig.update_yaxes(title_text="Output Variable", row=1, col=1)
fig.update_yaxes(title_text="Output Variable", row=1, col=2)



# get it borderless
fig = border_less(fig)

# Update layout
fig.update_layout(
    legend=dict(
        yanchor='top',
        y=0.98,
        xanchor='right',
        x=0.8,
        entrywidth=300,  
    ),
    # margin=dict(t=100)
)

fig.update_layout(
        width=900,
        height=500,
)


# fig.show()



cwd = Path.cwd()
# output_fold = cwd / "1_Data/2_Figs/2_Code_Created"
output_fold = cwd / "1_Data/2_Figs/0_Content/1_Chap/3_Optimization/"


# Save the plot as SVG
fig.write_image(output_fold/"11_Lin_Poly.svg")