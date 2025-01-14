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
            print(f"- {word:<17} appears {len(duplicates)} times in close proximity")

def find_typ_files(root_dir: str) -> List[Path]:
    return sorted(Path(root_dir).rglob("*.typ"))

def find_typ_file(specific_path: str) -> List[Path]:
    return [Path(specific_path)] if Path(specific_path).exists() else []


def analyze_duplicates(file_paths: List[Path], 
                      words: List[str], 
                      margin: int = 120) -> dict:
    results = {}
    for file_path in file_paths:
        text = file_path.read_text().lower()
        # Split text into words
        all_words = text.split()
        word_positions = {}
        
        for search_phrase in words:
            # Split search phrase into individual words
            phrase_words = search_phrase.split()
            phrase_len = len(phrase_words)
            
            # Find positions in terms of word count
            positions = []
            # Need to check up to len(all_words) - phrase_len + 1 to avoid index out of range
            for i in range(len(all_words) - phrase_len + 1):
                # Check if consecutive words match the phrase
                matches = True
                for j in range(phrase_len):
                    # For single words, use startswith
                    if phrase_len == 1:
                        if not all_words[i + j].startswith(phrase_words[j]):
                            matches = False
                            break
                    # For multi-word phrases, require exact matches
                    else:
                        if all_words[i + j] != phrase_words[j]:
                            matches = False
                            break
                if matches:
                    positions.append(i)
                    
            if positions:
                word_positions[search_phrase] = positions

            
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
b_last_word =  False
b_multiple =   False

files_list = [
    "2_Wr/0_Prerequire",            # 0
    "2_Wr/1_Chapters/0_Intro",      # 1
    "2_Wr/1_Chapters/1_Standards",  # 2
    "2_Wr/1_Chapters/2_Hydrogen",   # 3
    "2_Wr/1_Chapters/3_Loadcase",   # 4
    "2_Wr/1_Chapters/4_Optimization",   # 5
              ]

# files = find_typ_files(files_list[5])

# just fine: A
# contains some rep, but fine : BJ
# -------------------------------- prerequire -------------------------------- #
# singl_file = "2_Wr/0_Prerequire/1_Declaration.typ" # BJ
# singl_file = "2_Wr/0_Prerequire/2_Acknowledge.typ" # BJ
# singl_file = "2_Wr/0_Prerequire/3_Abstract.typ" # BJ


# ---------------------------------- chap 0 ---------------------------------- #
# singl_file = "2_Wr/1_Chapters/0_Intro/0_Intro.typ" # BJ
# singl_file = "2_Wr/1_Chapters/0_Intro/1_Motiv.typ" # A
# singl_file = "2_Wr/1_Chapters/0_Intro/2_Research_Objec.typ" # BJ
# singl_file = "2_Wr/1_Chapters/0_Intro/3_Work_Strucutre.typ" # BJ
# singl_file = "2_Wr/1_Chapters/0_Intro/4_Novelty.typ" # BJ
# singl_file = "2_Wr/1_Chapters/0_Intro/5_Research_Enabler.typ" # A
# singl_file = "2_Wr/1_Chapters/0_Intro/6_State_Of_Art.typ" # BJ

# ---------------------------- chap 1 - standards ---------------------------- #
# singl_file = "2_Wr/1_Chapters/1_Standards/0_Standards.typ" # A
# singl_file = "2_Wr/1_Chapters/1_Standards/1_Aero_Standards.typ" # BJ
# singl_file = "2_Wr/1_Chapters/1_Standards/2_Pressure_Vessels.typ" # BJ
# singl_file = "2_Wr/1_Chapters/1_Standards/3_Automotive.typ" # BJ
# singl_file = "2_Wr/1_Chapters/1_Standards/4_Various_Fields.typ" # A
# singl_file = "2_Wr/1_Chapters/1_Standards/5_Essential_Standards.typ" # BJ

# ------------------------------ chap 2 - hydro ------------------------------ #
# singl_file = "2_Wr/1_Chapters/2_Hydrogen/0_H2_Prop.typ" # BJ
# singl_file = "2_Wr/1_Chapters/2_Hydrogen/1_Safety.typ" # BJ
# singl_file = "2_Wr/1_Chapters/2_Hydrogen/2_Experiment.typ" # BJ
# singl_file = "2_Wr/1_Chapters/2_Hydrogen/3_Pressurized_Body.typ" # BJ

# ----------------------------- chap 3 - loadcase ---------------------------- #
# singl_file = "2_Wr/1_Chapters/3_Loadcase/0_Loadcase.typ" # BJ
# singl_file = "2_Wr/1_Chapters/3_Loadcase/1_Curv_Theory.typ" # BJ
# singl_file = "2_Wr/1_Chapters/3_Loadcase/2_Curv_3D.typ" # BJ
# singl_file = "2_Wr/1_Chapters/3_Loadcase/3_Curv_2D.typ" # BJ
# singl_file = "2_Wr/1_Chapters/3_Loadcase/4_Physical_Load.typ" # BJ 
# singl_file = "2_Wr/1_Chapters/3_Loadcase/5_Physical_Collet.typ" # BJ

# ----------------------------------- open ----------------------------------- #

# --------------------------- chap 4 - optimization -------------------------- #
# singl_file = "2_Wr/1_Chapters/4_Optimization/0_Discretize_Aero.typ" # BJ
# singl_file = "2_Wr/1_Chapters/4_Optimization/1_Get_Aero.typ" # BJ
# singl_file = "2_Wr/1_Chapters/4_Optimization/2_Beam_Model.typ" # BJ
singl_file = "2_Wr/1_Chapters/4_Optimization/3_Optim_Basics.typ" # BJ
# singl_file = "2_Wr/1_Chapters/4_Optimization/4_Beam_Opti.typ" #

# ---------------------------- optimization cases ---------------------------- #
# singl_file = "2_Wr/1_Chapters/4_Optimization/0_Opti_Cases/0_Res_Init.typ" # 
# singl_file = "2_Wr/1_Chapters/4_Optimization/0_Opti_Cases/1_Cases_B.typ" # 
# singl_file = "2_Wr/1_Chapters/4_Optimization/0_Opti_Cases/2_Cases_C.typ" # 
# singl_file = "2_Wr/1_Chapters/4_Optimization/0_Opti_Cases/2_Cases_D.typ" # 

# ------------------------------ chap - 5 final ------------------------------ #
# singl_file = "2_Wr/1_Chapters/5_Final/0_Discus.typ" # 
# singl_file = "2_Wr/1_Chapters/5_Final/1_Conc.typ" # 


# ---------------------------------------------------------------------------- #

if "singl_file" in locals():
    files = find_typ_file(singl_file)
    
words_to_find = w_h.words_2_find

if b_last_word :
    words_to_find = [words_to_find[-1]]    
# ------------------------- multiple files last word ------------------------- #
if b_multiple:
    print("running multiple files")
    for i, ct_file in enumerate(files_list):
        files = find_typ_files(ct_file)
        results = analyze_duplicates(files, words_to_find)
        
        print(f"\noutcome for {ct_file}")
        display_results(results=results)
        
    if b_last_word:
        print(f"\nlast word was: {words_to_find}")
        
# -------------------------------- single file ------------------------------- #
else:
    results = analyze_duplicates(files, words_to_find)
    display_results(results=results)

if "singl_file" in locals():
    print(f"\ndone with: {singl_file}")