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

def process_file(file_path: Path):
    content = file_path.read_text()
    
    def replace_citation(match):
        number = match.group(1)
        replacement = citation_mapping.get(number, match.group(0))
        if replacement != match.group(0):
            print(f"In file {file_path}:")
            print(f"  Would replace [{number}] with {replacement}")
        return match.group(0)  # Return original text to avoid making changes
    
    re.sub(r'\[(\d+)\]', replace_citation, content)
    

def process_directory(directory: Path):
    for file_path in directory.rglob('*.typ'):
        process_file(file_path)

def main():
    cwd = Path.cwd()
    
    script_directory = cwd / "2_Wr/1_Chapters/1_Chap/0_Standards"
    process_directory(script_directory)
    print("Finished scanning files. No changes were made.")

if __name__ == "__main__":
    main()