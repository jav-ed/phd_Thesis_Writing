import numpy as np
from sklearn.cluster import KMeans
import plotly.graph_objects as go
from plotly.subplots import make_subplots
import plotly.express as px
import random
import Path from pathlib

# Reset both numpy and random seeds
np.random.seed(42)
random.seed(42)

n_points = 100
positions = np.linspace(0, 10, n_points)
forces = 2 * np.sin(positions) + np.random.normal(0, 0.2, n_points)
X = np.column_stack([positions, forces])

# Apply kmeans++
n_clusters = 5
kmeans = KMeans(n_clusters=n_clusters, init='k-means++', random_state=42, n_init="auto")
labels = kmeans.fit_predict(X)
centroids = kmeans.cluster_centers_

# Get sorting order based on centroid positions (x-coordinates)
sorting_indices = np.argsort(centroids[:, 0])
sorted_centroids = centroids[sorting_indices]
sorted_labels = np.zeros_like(labels)
for new_label, old_label in enumerate(sorting_indices):
    sorted_labels[labels == old_label] = new_label

# Calculate forces
summed_forces = np.zeros(n_clusters)
averaged_forces = np.zeros(n_clusters)
cluster_forces = [[] for _ in range(n_clusters)]

for i in range(n_clusters):
    cluster_mask = sorted_labels == i
    summed_forces[i] = np.sum(forces[cluster_mask])
    averaged_forces[i] = np.mean(forces[cluster_mask])
    cluster_forces[i] = forces[cluster_mask]

# Create visualization
fig = make_subplots(
    rows=2, cols=2,
    specs=[[{"colspan": 2}, None],
           [{}, {}]],
    subplot_titles=('Original Data with Clusters and Centroids',
                   'Average Forces from Centroids', 
                   'Summed Forces per Cluster'))

# Get plotly default colors
colors = px.colors.qualitative.Set1[:n_clusters]
bg_colors = [f'rgba{color[3:-1]},0.1)' for color in colors]

txt_pos_centroids = ["bottom center", 
                     "top center", 
                     "top center", 
                     "bottom center", 
                     "top center"]

# Plot 1: Original data with colored backgrounds
for i in range(n_clusters):
    cluster_mask = sorted_labels == i
    
    # ------------------------------ background ------------------------------ #
    fig.add_trace(
        go.Scatter(
            x=[min(positions[cluster_mask]) -0.03, min(positions[cluster_mask]) -0.03, 
               max(positions[cluster_mask]) +0.03 , max(positions[cluster_mask]) +0.03],
            y=[min(forces)-1, max(forces)+1, 
               max(forces)+1, min(forces)-1],
            fill="toself",
            fillcolor=bg_colors[i],
            line=dict(width=0),
            showlegend=False,
            hoverinfo='none',
            mode = "lines",
        ),
        row=1, col=1
    )
    
    # ---------------------------- cluster points ---------------------------- #
    fig.add_trace(
        go.Scatter(
            x=positions[cluster_mask],
            y=forces[cluster_mask],
            mode='markers',
            name=f'Cluster {i}',
            marker=dict(size=8, color=colors[i], 
                        line=dict(color='black', width=1)),
            legendgroup="clusters",
            legendgrouptitle_text="Input Data",
        ),
        row=1, col=1
    )


# Plot 1: Original data with colored backgrounds
for i in range(n_clusters):
    cluster_mask = sorted_labels == i
    # ------------------------------- centroids ------------------------------ #
    fig.add_trace(
        go.Scatter(
            x=[sorted_centroids[i,0]],
            y=[sorted_centroids[i,1]],
            mode='markers+text',
            marker=dict(size=15, symbol='diamond', 
                        color=colors[i],  
                        line=dict(color='black', width=1)),
            name=f"Centroid {i}",
            text=np.round(sorted_centroids[i,1], 2),
            textposition=txt_pos_centroids[i],
            legendgroup="centroids",
            legendgrouptitle_text="Centroids",
        ),
        row=1, col=1
    )
# -------------------- Plot 2: Histogram of cluster forces ------------------- #


fig.add_trace(
    go.Bar(
        x=[f'Cluster {i}' for i in range(n_clusters)],
        y=sorted_centroids[:,1],
        text=np.round(sorted_centroids[:,1], 2),
        textposition='auto',
        marker_color=colors,
        name="Average Forces",
        legendgroup="analysis",
        legendgrouptitle_text="Force Analysis",
    ),
    row=2, col=1
)

# Plot 3: Bar plot of summed forces
fig.add_trace(
    go.Bar(
        x=[f'Cluster {i}' for i in range(n_clusters)],
        y=summed_forces,
        text=np.round(summed_forces, 2),
        textposition='auto',
        marker_color=colors,
        name="Summed Forces",
        legendgroup="analysis",
        legendgrouptitle_text="Force Analysis",
    ),
    row=2, col=2
)

# Update layout
fig.update_layout(
    title_text="Load Distribution Analysis",
    # height=800,
    showlegend=True,
    bargap=0.2,
    legend=dict(
    groupclick="toggleitem",  # allows clicking group title to show/hide all items
    tracegroupgap=30  # adds extra space between legend groups
)
)

# Update axes labels
fig.update_xaxes(title_text="Position", row=1, col=1)
fig.update_yaxes(title_text="Force", row=1, col=1)
fig.update_yaxes(title_text="Average Force", row=2, col=1)
fig.update_yaxes(title_text="Summed Force", row=2, col=2)


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
# get it borderless
fig = border_less(fig)

cwd = Path.cwd()
# output_fold = cwd / "1_Data/2_Figs/2_Code_Created"
output_fold = cwd / "1_Data/2_Figs/0_Content/1_Chap/3_Optimization/0_Aero_Discret"


# Save the plot as SVG
fig.write_image(output_fold/"12_Kmeans_Avg_Sum.svg")


fig.show()