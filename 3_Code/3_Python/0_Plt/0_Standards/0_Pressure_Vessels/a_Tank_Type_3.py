
import numpy as np
import plotly.graph_objects as go
from plotly.subplots import make_subplots

data_type_3 = np.array([
    
    [36.22, 70.10, 111.42, 149.24, 188.14, 233.27, 274.47, 322.26],
    [508.44, 997.85, 1616.72, 2162.42, 2725.88, 3410.67, 4013.16, 4743.98],
    [17.69, 19.63, 20.91, 21.92, 22.75, 23.46, 24.10, 24.67],
    [100, 200, 300, 400, 500, 600, 700, 800],
])


tank_mass_3 = data_type_3[0,:]
tank_cost_3 = data_type_3[1,:]
hydrogen_storage_3 = data_type_3[2,:]
pr_vaues_3 = data_type_3[3,:]


data_type_4 = np.array([
    # Tank Mass
    [29.14, 47.09, 65.43, 84.16, 98.48, 117.91, 137.74, 157.98, 173.43, 194.38, 215.74, 237.51, 254.1, 276.6, 299.51],
    
    # Tank Material Cost
    [506.74, 865.63, 1232.41, 1607.12, 1893.37, 2282.04, 2678.74, 3083.51, 3392.41, 3811.40, 4238.58, 4673.97, 5005.94, 5455.82, 5914.03],
    
    # Hydrogen Storage Capacity
    [1.94, 3.67, 5.19, 6.56, 7.78, 8.89, 9.90, 10.82, 11.67, 12.46, 13.19, 13.87, 14.52, 15.12, 15.69],
    
    # Tank Pressure
    [100, 200, 300, 400, 500, 600, 700, 800, 900, 1000, 1100, 1200, 1300, 1400, 1500]
])

# Assign meaningful names to each row
tank_mass_4 = data_type_4[0,:]
tank_cost_4 = data_type_4[1,:]
hydrogen_storage_4 = data_type_4[2,:]
pr_values_4 = data_type_4[3,:]


# ============================================================================ #
# =============================== recreate_plot ============================== #
# ============================================================================ #
def recreate_plot(tank_mass,
                  tank_cost,
                  hydrogen_storage,
                  pr_vaues):

    # Create figure with secondary y-axis
    fig = make_subplots(specs=[[{"secondary_y": True}]])

    # Add traces
    fig.add_trace(
        go.Bar(
            x=pr_vaues, 
            y=tank_mass, 
            name="Tank Mass", 
            marker_color='orange',
            text=tank_mass,
            textposition='outside',
            texttemplate='%{text:.2f}'
        ),
        secondary_y=False,
    )

    fig.add_trace(
        go.Bar(
            x=pr_vaues, 
            y=tank_cost, 
            name="Tank Material Cost", 
            marker_color='yellow',
            text=tank_cost,
            textposition='outside',
            texttemplate='%{text:.2f}'
        ),
        secondary_y=False,
    )

    fig.add_trace(
        go.Scatter(
            x=pr_vaues, 
            y=hydrogen_storage, 
            name="Hydrogen Storage Capacity", 
            marker_color='skyblue', 
            mode='lines+markers+text',
            text=hydrogen_storage,
            textposition='top center',
            texttemplate='%{text:.2f}'
        ),
        secondary_y=True,
    )

    # Set x-axis title
    fig.update_xaxes(title_text="Tank Pressure (bar)")

    # Set y-axes titles
    fig.update_yaxes(title_text="Type-III Tank Mass (kg) and Material Cost ($)", secondary_y=False)
    fig.update_yaxes(title_text="Hydrogen Storage Capacity (kg)", secondary_y=True)

    # Update layout
    fig.update_layout(
        title_text="Hydrogen Tank Analysis",
        barmode='group',
        legend=dict(
            orientation="h",
            yanchor="bottom",
            y=1.02,
            xanchor="right",
            x=1
        ),
        showlegend=True,
        # height=600,  # Increase height to accommodate labels
        margin=dict(t=150)  # Increase top margin for legend
    )

    # Show the plot
    fig.show()
    
    
# ============================================================================ #
# ============================ mass_specific_costs =========================== #
# ============================================================================ #

def compare_tank_masses_bar(pr_values_3, tank_mass_3, pr_values_4, tank_mass_4):
    # Create figure
    fig = go.Figure()

    # Add bar traces for Type 3 and Type 4 tank masses
    fig.add_trace(go.Bar(x=pr_values_3, y=tank_mass_3,
                         name='Type 3 Tank Mass',
                         marker_color='blue',
                         text=tank_mass_3,
                         textposition='outside',
                         texttemplate='%{text:.2f}'))

    fig.add_trace(go.Bar(x=pr_values_4, y=tank_mass_4,
                         name='Type 4 Tank Mass',
                         marker_color='red',
                         text=tank_mass_4,
                         textposition='outside',
                         texttemplate='%{text:.2f}'))

    # Update layout
    fig.update_layout(
        title='Comparison of Tank Masses: Type 3 vs Type 4',
        xaxis_title='Tank Pressure (bar)',
        yaxis_title='Tank Mass (kg)',
        barmode='group',
        bargap=0.15,
        bargroupgap=0.1,
        legend_title='Tank Type',
        font=dict(size=12),
        height=600,
        width=1200,
        legend=dict(
            yanchor="top",
            y=0.99,
            xanchor="left",
            x=0.01,
            bgcolor="rgba(255, 255, 255, 0.5)"
        )
    )

    # Update x-axis to show all pressure values
    all_pressures = sorted(list(set(pr_values_3.tolist() + pr_values_4.tolist())))
    fig.update_xaxes(tickmode='array', tickvals=all_pressures, ticktext=all_pressures)

    # Show the plot
    fig.show()


# ============================================================================ #
# ====================== compare_tank_material_costs_bar ===================== #
# ============================================================================ #
def compare_tank_material_costs_bar(pr_values_3, tank_cost_3, pr_values_4, tank_cost_4):
    # Create figure
    fig = go.Figure()

    # Add bar traces for Type 3 and Type 4 tank material costs
    fig.add_trace(go.Bar(x=pr_values_3, y=tank_cost_3,
                         name='Type 3 Tank Material Cost',
                         marker_color='blue',
                         text=tank_cost_3,
                         textposition='outside',
                         texttemplate='%{text:.2f}'))

    fig.add_trace(go.Bar(x=pr_values_4, y=tank_cost_4,
                         name='Type 4 Tank Material Cost',
                         marker_color='red',
                         text=tank_cost_4,
                         textposition='outside',
                         texttemplate='%{text:.2f}'))

    # Update layout
    fig.update_layout(
        title='Comparison of Tank Material Costs: Type 3 vs Type 4',
        xaxis_title='Tank Pressure (bar)',
        yaxis_title='Tank Material Cost ($)',
        barmode='group',
        bargap=0.15,
        bargroupgap=0.1,
        legend_title='Tank Type',
        font=dict(size=12),
        height=600,
        width=1200,
        legend=dict(
            yanchor="top",
            y=0.99,
            xanchor="left",
            x=0.01,
            bgcolor="rgba(255, 255, 255, 0.5)"
        )
    )

    # Update x-axis to show all pressure values
    all_pressures = sorted(list(set(pr_values_3.tolist() + pr_values_4.tolist())))
    fig.update_xaxes(tickmode='array', tickvals=all_pressures, ticktext=all_pressures)

    # Show the plot
    fig.show()


# ============================================================================ #
# ====================== compare_mass_specific_costs_bar ===================== #
# ============================================================================ #
def compare_mass_specific_costs_bar(pr_values_3, tank_mass_3, tank_cost_3, pr_values_4, tank_mass_4, tank_cost_4):
    # Calculate mass-specific costs
    mass_specific_cost_3 = tank_cost_3 / tank_mass_3
    mass_specific_cost_4 = tank_cost_4 / tank_mass_4

    # Create figure
    fig = go.Figure()

    # Add bar traces for Type 3 and Type 4 mass-specific costs
    fig.add_trace(go.Bar(x=pr_values_3, y=mass_specific_cost_3,
                         name='Type 3 Mass-Specific Cost',
                         marker_color='blue',
                         text=mass_specific_cost_3,
                         textposition='outside',
                         texttemplate='%{text:.2f}'))

    fig.add_trace(go.Bar(x=pr_values_4, y=mass_specific_cost_4,
                         name='Type 4 Mass-Specific Cost',
                         marker_color='red',
                         text=mass_specific_cost_4,
                         textposition='outside',
                         texttemplate='%{text:.2f}'))

    # Update layout
    fig.update_layout(
        title='Comparison of Mass-Specific Costs: Type 3 vs Type 4',
        xaxis_title='Tank Pressure (bar)',
        yaxis_title='Mass-Specific Cost ($/kg)',
        barmode='group',
        bargap=0.15,
        bargroupgap=0.1,
        legend_title='Tank Type',
        font=dict(size=12),
        height=600,
        width=1200,
        legend=dict(
            yanchor="top",
            y=0.99,
            xanchor="left",
            x=0.01,
            bgcolor="rgba(255, 255, 255, 0.5)"
        )
    )

    # Update x-axis to show all pressure values
    all_pressures = sorted(list(set(pr_values_3.tolist() + pr_values_4.tolist())))
    fig.update_xaxes(tickmode='array', tickvals=all_pressures, ticktext=all_pressures)

    # Show the plot
    fig.show()


# Call the function with the provided data
compare_tank_masses_bar(pr_vaues_3, tank_mass_3, pr_values_4, tank_mass_4)


# Call the function with the provided data
compare_tank_material_costs_bar(pr_vaues_3, tank_cost_3, pr_values_4, tank_cost_4)


# Call the function with the provided data
compare_mass_specific_costs_bar(pr_vaues_3, tank_mass_3, tank_cost_3, pr_values_4, tank_mass_4, tank_cost_4)

# Call the function with the data
# mass_specific_costs(tank_mass_3, tank_cost_3, pr_vaues_3)