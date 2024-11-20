import numpy as np
from sklearn.cluster import KMeans
import plotly.graph_objects as go
from plotly.subplots import make_subplots
import plotly.express as px
import random


# Reset both numpy and random seeds
np.random.seed(42)
random.seed(42)

n_points = 100
positions = np.linspace(0, 10, n_points)
forces = 2 * np.sin(positions) + np.random.normal(0, 0.2, n_points)
X = np.column_stack([positions, forces])

# Apply kmeans++
n_clusters = 5
kmeans = KMeans(n_clusters=n_clusters, init='k-means++', random_state=42)
labels = kmeans.fit_predict(X)
centroids = kmeans.cluster_centers_

# Calculate forces
summed_forces = np.zeros(n_clusters)
averaged_forces = np.zeros(n_clusters)
cluster_forces = [[] for _ in range(n_clusters)]

for i in range(n_clusters):
    cluster_mask = labels == i
    summed_forces[i] = np.sum(forces[cluster_mask])
    averaged_forces[i] = np.mean(forces[cluster_mask])
    cluster_forces[i] = forces[cluster_mask]

# Create visualization
fig = make_subplots(
    rows=2, cols=2,
    specs=[[{"colspan": 2}, None],
           [{}, {}]],
    subplot_titles=('Original Data with Clusters and Centroids',
                   'Force Distribution in Clusters', 
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
    cluster_mask = labels == i
    
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
            marker=dict(size=8, color=colors[i], line=dict(color='black', width=1))
        ),
        row=1, col=1
    )

    # ------------------------------- centroids ------------------------------ #
    fig.add_trace(
        go.Scatter(
            x=[centroids[i,0]],
            y=[centroids[i,1]],
            mode='markers+text',
            marker=dict(size=15, symbol='diamond', 
                        color=colors[i],  
                        line=dict(color='black', width=1)),
            name='Forces',
            text=np.round(centroids[i,1], 2),
            textposition=txt_pos_centroids[i],
        ),
        row=1, col=1
    )
# -------------------- Plot 2: Histogram of cluster forces ------------------- #

fig.add_trace(
    go.Bar(
        x=[f'Cluster {i}' for i in range(n_clusters)],
        y=centroids[:,1],
        text=np.round(centroids[:,1], 2),
        textposition='auto',
        marker_color=colors
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
        marker_color=colors
    ),
    row=2, col=2
)

# Update layout
fig.update_layout(
    title_text="Load Distribution Analysis",
    height=800,
    showlegend=True,
    bargap=0.2
)

# Update axes labels
fig.update_xaxes(title_text="Position", row=1, col=1)
fig.update_yaxes(title_text="Force", row=1, col=1)
fig.update_xaxes(title_text="Force Magnitude", row=2, col=1)
fig.update_yaxes(title_text="Count", row=2, col=1)
fig.update_xaxes(title_text="Cluster", row=2, col=2)
fig.update_yaxes(title_text="Summed Force", row=2, col=2)

fig.show()