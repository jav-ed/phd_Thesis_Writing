import numpy as np
from sympy import symbols, diff, hessian, Matrix
from sympy.utilities.lambdify import lambdify


def find_saddle_points(expr_str, vars_list):
    """
    Analyzes a function to find saddle points using the second derivative test.
    
    Parameters:
    expr_str (str): String representation of the mathematical expression
    vars_list (list): List of variable names as strings
    
    Returns:
    list: List of dictionaries containing critical points and their classification
    """
    # Convert variable names to sympy symbols
    vars_symb = symbols(vars_list)
    
    # Convert string expression to sympy expression
    from sympy import sympify
    expr = sympify(expr_str)
    
    # Calculate gradients
    gradients = [diff(expr, var) for var in vars_symb]
    
    # Calculate Hessian matrix
    H = hessian(expr, vars_symb)
    
    # Find critical points by solving gradient = 0
    from sympy import solve
    critical_points = solve(gradients, vars_symb, dict=True)
    
    results = []
    
    for point in critical_points:
        # Evaluate Hessian at critical point
        H_at_point = H.subs(point)
        
        # Convert to numpy array for eigenvalue calculation
        H_numpy = np.array(H_at_point).astype(float)
        
        # Calculate eigenvalues
        eigenvals = np.linalg.eigvals(H_numpy)
        
        # Classify the critical point
        if all(eig > 0 for eig in eigenvals):
            classification = "Local minimum"
        elif all(eig < 0 for eig in eigenvals):
            classification = "Local maximum"
        elif any(eig == 0 for eig in eigenvals):
            classification = "Requires further analysis"
        else:
            classification = "Saddle point"
        
        results.append({
            'point': point,
            'classification': classification,
            'eigenvalues': eigenvals
        })
    
    return results

# Example usage function
def analyze_function(expr_str, vars_list):
    """
    Wrapper function to analyze and print results in a readable format
    """
    results = find_saddle_points(expr_str, vars_list)
    
    print(f"Analysis of function: {expr_str}")
    print("=" * 50)
    
    for i, result in enumerate(results, 1):
        print(f"\nCritical Point {i}:")
        print(f"Location: {result['point']}")
        print(f"Classification: {result['classification']}")
        print(f"Eigenvalues: {result['eigenvalues']}")
        
        
# Example usage for f(x,y) = x^2 - y^2
# expr = "x**2 - y**2"
# vars = ['x', 'y']
vars = ['x']


# expr = "sin(x)"
expr = "x+ sin(x)"

analyze_function(expr, vars)