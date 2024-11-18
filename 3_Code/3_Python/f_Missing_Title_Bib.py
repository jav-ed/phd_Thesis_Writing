"""
BibTeX Missing Titles Finder

This script compares two BibTeX files to identify titles that exist in a reference BibTeX file
but are missing from the main BibTeX file. The comparison is case-insensitive and ignores
whitespace for more robust matching.

The script expects two BibTeX files:
- Main BibTeX file: "1_Data/1_Bib/bib.bib"
- Reference BibTeX file: "3_Code/3_Python/1_Data/bib_rep_2022.bib"

Output includes:
- Statistics on the number of entries in each file
- List of titles that are in the reference file but not found in the main file
- Summary statistics of the comparison
"""

import bibtexparser
from pathlib import Path
from collections import defaultdict

def create_custom_parser():
    """Create a parser that accepts custom entry types."""
    parser = bibtexparser.bparser.BibTexParser(common_strings=True)
    parser.customization = lambda record: record
    parser.ignore_nonstandard_types = False
    return parser

def read_bib_file(file_path):
    """Read BibTeX file and return entries."""
    parser = create_custom_parser()
    try:
        with open(file_path, 'r', encoding='utf-8') as bibtex_file:
            bib_database = bibtexparser.load(bibtex_file, parser=parser)
        return bib_database.entries
    except Exception as e:
        print(f"Error reading {file_path}: {e}")
        return []

def normalize_title(title):
    """Normalize title for comparison by removing spaces and converting to lowercase."""
    if not title:
        return ""
    return ''.join(title.lower().split())

def find_missing_titles(main_entries, ref_entries):
    """Find titles that exist in reference entries but not in main entries."""
    # Create set of normalized main titles
    main_titles = {normalize_title(entry.get('title', '')) for entry in main_entries}
    
    # Track missing titles with their original format and bib key
    missing_titles = []
    for entry in ref_entries:
        original_title = entry.get('title', '')
        normalized_title = normalize_title(original_title)
        
        if normalized_title and normalized_title not in main_titles:
            missing_titles.append({
                'title': original_title,
                'key': entry.get('ID', 'No Key'),
                'year': entry.get('year', 'No Year')
            })
    
    return missing_titles

def main():
    # Define file paths
    cwd = Path.cwd()
    main_bib_path = cwd / "1_Data/1_Bib/bib.bib"
    
    # # fine
    # ref_bib_path = cwd / "3_Code/3_Python/1_Data/bib_rep_2022.bib"
    
    ref_bib_path = cwd / "3_Code/3_Python/1_Data/bib_rep_2023.bib"
    
    # Read both bib files
    print("Reading BibTeX files...Towards a general-purpose foundation model for computational pa")
    main_entries = read_bib_file(main_bib_path)
    ref_entries = read_bib_file(ref_bib_path)
    
    print(f"\nMain BibTeX file has {len(main_entries)} entries")
    print(f"Reference BibTeX file has {len(ref_entries)} entries")
    
    # Find missing titles
    missing_titles = find_missing_titles(main_entries, ref_entries)
    
    # Report results
    print(f"\nFound {len(missing_titles)} titles in reference that are missing from main:")
    if missing_titles:
        print("\nMissing Titles:")
        for i, entry in enumerate(missing_titles, 1):
            print(f"\n{i}. Title: {entry['title']}")
            print(f"   Key: {entry['key']}")
            print(f"   Year: {entry['year']}")
    else:
        print("All titles from the reference file were found in the main file!")
    
    # Print summary statistics
    print(f"\nSummary:")
    print(f"- Total entries in reference: {len(ref_entries)}")
    print(f"- Missing entries: {len(missing_titles)}")
    print(f"- Matching entries: {len(ref_entries) - len(missing_titles)}")
    print(f"- Match rate: {((len(ref_entries) - len(missing_titles)) / len(ref_entries) * 100):.1f}%")

if __name__ == "__main__":
    main()