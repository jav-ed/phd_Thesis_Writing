import numpy as np
from sklearn.cluster import KMeans
import plotly.graph_objects as go
from plotly.subplots import make_subplots

# Generate sample data
np.random.seed(42)
n_points = 100
positions = np.linspace(0, 10, n_points)
# Create a non-uniform force distribution
forces = 2 * np.sin(positions) + np.random.normal(0, 0.2, n_points)
X = np.column_stack([positions, forces])

# Apply kmeans++
n_clusters = 5
kmeans = KMeans(n_clusters=n_clusters, init='k-means++', random_state=42)
labels = kmeans.fit_predict(X)
centroids = kmeans.cluster_centers_

# Calculate summed forces for each cluster
summed_forces = np.zeros(n_clusters)
avergaed_forces = np.zeros(n_clusters)
for i in range(n_clusters):
    cluster_mask = labels == i
    summed_forces[i] = np.sum(forces[cluster_mask])
    avergaed_forces[i] = np.mean(forces[cluster_mask])

# Check if averaged forces match centroid forces within tolerance
is_close = np.allclose(avergaed_forces, centroids[:,1], rtol=1e-10, atol=1e-10)
print(f"Averaged forces match centroid forces: {is_close}")

# Create visualization
fig = make_subplots(rows=2, cols=1, 
                    subplot_titles=('Original Data with Centroids (Averaged Forces)',
                                  'Original Data with Summed Forces'))

# Plot 1: Original data with centroids (averaged forces)
fig.add_trace(
    go.Scatter(x=positions, y=forces, mode='markers', name='Original Data',
               marker=dict(color=labels, colorscale='Viridis')),
    row=1, col=1
)

fig.add_trace(
    go.Scatter(x=centroids[:,0], y=centroids[:,1], mode='markers+text',
               marker=dict(size=15, symbol='arrow', color='red'),
               name='Centroids (Averaged)', text=np.round(centroids[:,1], 2)),
    row=1, col=1
)

# ----------------- Plot 2: Original data with summed forces ----------------- #
fig.add_trace(
    go.Scatter(x=positions, y=forces, mode='markers', name='Original Data',
               marker=dict(color=labels, colorscale='Viridis'),
               showlegend=False),
    row=2, col=1
)
fig.add_trace(
    go.Scatter(x=centroids[:,0], 
               y=summed_forces, mode='markers+text',
               marker=dict(size=15, symbol='arrow', color='red'),
               name='Summed Forces', text=np.round(summed_forces, 2)),
    row=2, col=1
)

# Update layout
fig.update_layout(
    # height=800, 
    # width=1000, 
    title_text="Comparison of Force Representations",
    showlegend=True)
fig.update_xaxes(title_text="Position", row=2, col=1)
fig.update_xaxes(title_text="Position", row=1, col=1)
fig.update_yaxes(title_text="Force", row=1, col=1)
fig.update_yaxes(title_text="Force", row=2, col=1)

fig.show()