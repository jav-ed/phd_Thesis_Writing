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

def replace_equation_numbers(text: str, increment: int, ignore: int = None) -> str:
    """
    Replace eq_X with eq_(X+increment) in the given text
    
    Args:
        text: Input text containing equation references
        increment: Number to add to equation references
        ignore: Optional - Numbers <= this value will not be modified
    """
    def add_increment(match):
        num = int(match.group(1))
        if ignore is None or num > ignore:
            return f'eq_{num + increment}'
        return match.group(0)
    
    # re.sub replaces all matches found in the text by default
    # first find all occurces, save them, and when search and mach process finsihes the replacement starts
    return re.sub(r'eq_(\d+)', add_increment, text)

def replace_figure_numbers(text: str, increment: int, ignore: int = None) -> str:
    """
    Replace fig_X with fig_(X+increment) in the given text
    
    Args:
        text: Input text containing figure references
        increment: Number to add to figure references
        ignore: Optional - Numbers <= this value will not be modified
    """
    def add_increment(match):
        num = int(match.group(1))
        if ignore is None or num > ignore:
            return f'fig_{num + increment}'
        return match.group(0)
    
    # re.sub replaces all matches found in the text by default
    # first find all occurces, save them, and when search and mach process finsihes the replacement starts
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


# ---------------------------------------------------------------------------- #
file_paths= [
    # "2_Wr/1_Chapters/1_Chap/3_Optimization/0_Discretize_Aero.typ",
    # "2_Wr/1_Chapters/1_Chap/3_Optimization/1_Get_Aero.typ",
    # "2_Wr/1_Chapters/1_Chap/3_Optimization/2_Beam_Model.typ",
    "2_Wr/1_Chapters/1_Chap/3_Optimization/3_Optim_Basics.typ",
    "2_Wr/1_Chapters/1_Chap/3_Optimization/4_Beam_Opti.typ",
]

for i_c, ct_file in enumerate(file_paths):
        
    # Configuration
    ct_file_path = Path(ct_file)  

    # Read the file
    content = ct_file_path.read_text()
    original_content = content

    print("# ------------------------------------------------------------------------ #")
    print(f"current file: {ct_file_path}")
    print("# ------------------------------------------------------------------------ #")
    # ------------------------------------ eqs ----------------------------------- #
    # the number ignore will leave all the eq_ignore untouched, every eq_int that is bigger than eq_ignore will be modifed 
    # ignore = None | int
    # if you need eq_70 to be free, choose: ignore=69
    # if you want to remove: eq_70, chose: ignore=69 and increment=-1
    content = replace_equation_numbers(content, increment=1,  ignore= 102)
    print_changes(original_content, content, r'eq_(\d+)')

    # ----------------------------------- figs ----------------------------------- #
    # For figures (modify the increment number as needed):
    # the number ignore will leave all the fig_ignore untouched, every fig_int that is bigger than fig_ignore will be modifed 
    # ignore = None | int
    # if you need fig_70 to be free, choose: ignore=69
    # content = replace_figure_numbers(content, increment=1, ignore= 74)
    # print_changes(original_content, content, r'fig_(\d+)')

    # --------------------------------- activate --------------------------------- #
    # # Write the changes back to the file
    ct_file_path.write_text(content)