from pathlib import Path

# ---------------------------------------------------------------------------- #
import sys
cwd = Path.cwd()
sys.path.append(str(cwd))
# ---------------------------------------------------------------------------- #

from typing import List, Tuple
import re

import b_Words_2_Find as w_h


def display_results(results: dict):
    if len(results) == 0:
        print("\nNo duplicates found in close proximity - just fine")
    
    for file_path, word_data in results.items():
        print(f"\nFile: {file_path}")
        for word, duplicates in word_data.items():
            print(f"- {word:<30} appears {len(duplicates)} times in close proximity")

def find_typ_files(root_dir: str) -> List[Path]:
    return sorted(Path(root_dir).rglob("*.typ"))

def find_typ_file(specific_path: str) -> List[Path]:
    return [Path(specific_path)] if Path(specific_path).exists() else []


def analyze_duplicates(file_paths: List[Path], 
                      words: List[str], 
                      margin: int = 120) -> dict:
    results = {}
    for file_path in file_paths:
        text = file_path.read_text()
        # Split text into words
        all_words = text.split()
        word_positions = {}
        
        for search_word in words:
            # Find positions in terms of word count
            positions = []
            for i, word in enumerate(all_words):
                if word.startswith(search_word):
                    positions.append(i)
            word_positions[search_word] = positions
            
        duplicates = {}
        for word, positions in word_positions.items():
            close_duplicates = []
            for i in range(len(positions)-1):
                for j in range(i+1, len(positions)):
                    if abs(positions[j] - positions[i]) <= margin:
                        close_duplicates.append((positions[i], positions[j]))
            if close_duplicates:
                duplicates[word] = close_duplicates
                
        if duplicates:
            results[str(file_path)] = duplicates
            
    return results

# ---------------------------------------------------------------------------- #
# if only the last word shall be checked
# b_last_word = True
b_last_word = False

# files = find_typ_files("2_Wr/1_Chapters/0_Intro")
# files = find_typ_files("2_Wr/1_Chapters/1_Standards")

# just fine: A
# contains some rep, but fine : BJ
# ---------------------------------- chap 0 ---------------------------------- #
# singl_file = "2_Wr/1_Chapters/0_Intro/0_Intro.typ" # BJ
# singl_file = "2_Wr/1_Chapters/0_Intro/1_Motiv.typ" # A
# singl_file = "2_Wr/1_Chapters/0_Intro/2_Research_Objec.typ" # BJ
# singl_file = "2_Wr/1_Chapters/0_Intro/3_Work_Strucutre.typ" # BJ
# singl_file = "2_Wr/1_Chapters/0_Intro/4_Novelty.typ" # BJ
# singl_file = "2_Wr/1_Chapters/0_Intro/5_Research_Enabler.typ" # A
# singl_file = "2_Wr/1_Chapters/0_Intro/6_State_Of_Art.typ" # A

# ---------------------------- chap 1 - standards ---------------------------- #
# singl_file = "2_Wr/1_Chapters/1_Standards/0_Standards.typ" # A
# singl_file = "2_Wr/1_Chapters/1_Standards/1_Aero_Standards.typ" # BJ
# singl_file = "2_Wr/1_Chapters/1_Standards/2_Pressure_Vessels.typ" # BJ
# singl_file = "2_Wr/1_Chapters/1_Standards/3_Automotive.typ" # BJ
# singl_file = "2_Wr/1_Chapters/1_Standards/4_Various_Fields.typ" # A
singl_file = "2_Wr/1_Chapters/1_Standards/5_Essential_Standards.typ" # BJ

# ---------------------------------------------------------------------------- #

if "singl_file" in locals():
    files = find_typ_file(singl_file)
words_to_find = w_h.words_2_find

if b_last_word:
    words_to_find = [words_to_find[-1]]

results = analyze_duplicates(files, words_to_find)
display_results(results=results)

if "singl_file" in locals():
    print(f"\ndone with: {singl_file}")