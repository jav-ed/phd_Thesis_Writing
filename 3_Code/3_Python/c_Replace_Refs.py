"""
Reference Number Updating Script
-------------------------------

A utility script for automatically updating equation and figure reference numbers in text files.
Particularly useful for academic or technical documents where reference numbers need to be
adjusted after content changes.

The script can:
- Update equation references (e.g., eq_1 → eq_2)
- Update figure references (e.g., fig_1 → fig_2)
- Print a summary of changes
- Process files while preserving their original structure

Requirements:
    - Python 3.6+
    - pathlib (standard library)
    - re (standard library)

Usage:
    1. Set the file_path variable to your target file
    2. Adjust the increment values as needed
    3. Run the script to update references

Example:
    file_path = Path("document.typ")
    content = file_path.read_text()
    content = replace_equation_numbers(content, increment=1)
    file_path.write_text(content)
"""


from pathlib import Path
import re

def replace_equation_numbers(text: str, increment: int) -> str:
    """Replace eq_X with eq_(X+increment) in the given text"""
    def add_increment(match):
        num = int(match.group(1))
        return f'eq_{num + increment}'
    
    return re.sub(r'eq_(\d+)', add_increment, text)

def replace_figure_numbers(text: str, increment: int) -> str:
    """Replace fig_X with fig_(X+increment) in the given text"""
    def add_increment(match):
        num = int(match.group(1))
        return f'fig_{num + increment}'
    
    return re.sub(r'fig_(\d+)', add_increment, text)

def print_changes(original: str, new: str, pattern: str) -> None:
    """Print a summary of changes made for a given pattern"""
    original_numbers = re.findall(pattern, original)
    new_numbers = re.findall(pattern, new)
    
    if original_numbers:
        prefix = "eq_" if "eq_" in pattern else "fig_"
        print(f"\nModified {len(original_numbers)} {prefix.rstrip('_')} numbers:")
        for old, new in zip(original_numbers, new_numbers):
            print(f"{prefix}{old} → {prefix}{new}")

# Configuration
file_path = Path("2_Wr/1_Chapters/1_Chap/3_Optimization/3_Optim_Basics.typ")  # Modify this to your file path

# Read the file
content = file_path.read_text()
original_content = content

# ------------------------------------ eqs ----------------------------------- #
content = replace_equation_numbers(content, increment=1)
print_changes(original_content, content, r'eq_(\d+)')

# ----------------------------------- figs ----------------------------------- #
# For figures (modify the increment number as needed):
# content = replace_figure_numbers(content, increment=48)
# print_changes(original_content, content, r'fig_(\d+)')

# --------------------------------- activate --------------------------------- #
# # Write the changes back to the file
# file_path.write_text(content)