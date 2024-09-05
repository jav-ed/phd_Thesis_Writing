"""
Citation Mapper

This script processes text files in the current directory and its subdirectories,
replacing citation numbers with their corresponding references. It's designed to
update citations from a 2022 report format to a current PhD typst format.

The script does the following:
1. Walks through all subdirectories starting from the script's location.
2. For each .typ file found:
   a. Reads the content of the file.
   b. Searches for citation numbers in the format [number].
   c. Replaces these citations with corresponding @references based on a predefined mapping.
   d. Writes the updated content back to the file.

Usage:
1. Place this script in the root directory of your project.
2. Run the script using: python citation_mapper.py
3. The script will process all .typ files in the current directory and its subdirectories.

Note: Make sure to backup your files before running this script, as it modifies files in-place.
"""

from pathlib import Path
import re

# Citation mapping dictionary
citation_mapping = {
    "1": "@barral2006hydrogen",
    "2": "@Su2021",
    "3": "@khzouz2020hydrogen",
    "4": "@Bleser2012",
    "5": "@img_Toyota",
    "6": "@img_Truck",
    "7": "@img_Transport",
    "8": "@img_Ground",
    "9": "@Cebolla2019",
    "10": "@Stahl2017",
    "11": "@ChristophBechtold2019",
    "12": "@Klell2018 @Klell2023",
    "13": "@Rosen2018",
    "14": "@dryer2007spontaneous",
    "15": "@Thomas1997",
    "16": "@lemmon2006standardized",
    "17": "@Sigloch2022",
    "18": "@schefer2009visible",
    "19": "@Xu2009",
    "20": "@astbury2007spontaneous",
    "21": "@jallais2017effects",
    "22": "@mitsuishi2000dynamic",
    "23": "@perfetto2022numerical",
    "24": "@farhood2021low",
    "25": "@goto1980studies",
    "26": "@schwer1988response",
    "27": "@jones1996influence",
    "28": "@Liu2019",
    "29": "@Gross2021",
    "30": "@mdobook",

}



# ============================================================================ #
# =============================== process_file =============================== #
# ============================================================================ #
def process_file(file_path: Path):
    content = file_path.read_text()
    undefined_citations = []
    modifications = []
    
    def replace_citation(match):
        number = match.group(1)
        
        if number not in citation_mapping:
            undefined_citations.append(number)
            return match.group(0)
        
        replacement = citation_mapping[number]
        modifications.append((number, replacement))
        
        # if modifcation desired, replace it, otherwise no replacement
        return replacement if b_mod_files else match.group(0)
    
    new_content = re.sub(r'\[(\d+)\]', replace_citation, content)
    
    if undefined_citations:
        print(f"\nWarning: Undefined citations found in {file_path}:")
        for citation in undefined_citations:
            print(f"  [{citation}]")
        print("Please add these citations to the mapping or remove them from the file.")
        return False
    
    if modifications:
        print(f"\nIn file {file_path}:")
        for number, replacement in modifications:
            print(f"  {'Replacing' if b_mod_files else 'Would replace'} [{number}] with {replacement}")
        
        if b_mod_files:
            file_path.write_text(new_content)
            print("  Changes applied.")
    
    return True

# ============================================================================ #
# ============================= process_directory ============================ #
# ============================================================================ #
def process_directory(directory: Path):
    all_files_processed = True
    for file_path in directory.rglob('*.typ'):
        if not process_file(file_path):
            all_files_processed = False
            break
    return all_files_processed

def run_Main(script_directory):
    if process_directory(script_directory):
        
        # done
        print(f"\nAll files processed successfully. {'Changes applied.' if b_mod_files else 'No changes made (preview mode).'}")
    else:
        print("\nProcessing stopped due to undefined citations.")

# ---------------------------------------------------------------------------- #
    
# Set this flag to True to modify files, False to preview changes
b_mod_files = True

# define path
# script_directory= Path("2_Wr/1_Chapters/1_Chap/0_Standards")
script_directory= Path("2_Wr/1_Chapters/1_Chap/1_Hydrogen")


run_Main(script_directory)