"""
BibTeX Duplicate Entry Finder
----------------------------

Duplication finder based on title

A utility script for finding and displaying duplicate entries in BibTeX files.
Handles custom entry types and performs case-insensitive title comparison to
identify potential duplicates in bibliographic databases.

Features:
    - Supports custom BibTeX entry types
    - Case-insensitive title comparison
    - Detailed duplicate entry reporting
    - UTF-8 encoding support

Requirements:
    - Python 3.6+
    - bibtexparser library
    - pathlib (standard library)
    - collections (standard library)

Usage:
    Run the script directly to process 'bib.bib' in the '1_Data/1_Bib/' directory:
    $ python bibtex_duplicate_finder.py
"""

import bibtexparser
from collections import defaultdict
from pathlib import Path

def create_custom_parser():
    """Create a parser that accepts custom entry types."""
    parser = bibtexparser.bparser.BibTexParser(common_strings=True)
    
    # Add custom entry types to the parser
    parser.customization = lambda record: record
    
    # Define additional entry types
    parser.ignore_nonstandard_types = False
    
    return parser

def read_bib_file(file_path):
    """Read BibTeX file with custom parser that accepts non-standard entry types."""
    parser = create_custom_parser()
    with open(file_path, 'r', encoding='utf-8') as bibtex_file:
        bib_database = bibtexparser.load(bibtex_file, parser=parser)
    return bib_database.entries

def find_duplicates(entries):
    """Find duplicate entries based on title."""
    name_dict = defaultdict(list)
    for entry in entries:
        # Strip whitespace and convert to lowercase for comparison
        title = entry.get('title', '').lower().strip()
        if title:  # Only add entries with non-empty titles
            name_dict[title].append(entry)
    
    # for name, entries in name_dict.items():
    #     if len(entries)> 1:
    #         print("stop")
            
    # name_dict[title] will output the found bib entries
    duplicates = {name: entries for name, entries in name_dict.items() if len(entries) > 1}
    return duplicates

def print_duplicates(duplicates):
    """Print duplicate entries with additional entry type information."""
    if not duplicates:
        print("No duplicates found.")
    else:
        print("Duplicates found:")
        for name, entries in duplicates.items():
            print(f"\nDuplicate entries for '{name}':")
            for i, entry in enumerate(entries, 1):
                print(f"  Entry {i}:")
                print(f"    Entry Type: {entry.get('ENTRYTYPE', 'N/A')}")
                print(f"    Title: {entry.get('title', 'N/A')}")
                print(f"    Author: {entry.get('author', 'N/A')}")
                print(f"    Year: {entry.get('year', 'N/A')}")
                if 'url' in entry:
                    print(f"    URL: {entry.get('url', 'N/A')}")

def main():
    cwd = Path.cwd()
    bib_file_path = cwd / "1_Data/1_Bib/bib.bib"
    
    try:
        entries = read_bib_file(bib_file_path)
        print(f"Successfully loaded {len(entries)} entries")
        print(f"Entry types found: {set(entry.get('ENTRYTYPE') for entry in entries)}\n")
        
        duplicates = find_duplicates(entries)
        print_duplicates(duplicates)
        
    except Exception as e:
        print(f"Error processing BibTeX file: {e}")

if __name__ == "__main__":
    main()