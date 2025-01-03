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

# Example usage:
# files = find_typ_files("2_Wr/1_Chapters/0_Intro")

files = find_typ_file("2_Wr/1_Chapters/0_Intro/0_Intro.typ")
words_to_find = w_h.words_2_find

results = analyze_duplicates(files, words_to_find)
display_results(results=results)