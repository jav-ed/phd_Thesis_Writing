"""
BibTeX File Comparator and Analyzer

This script performs a comprehensive comparison between two BibTeX files, conducting two main analyses:

1. Key-Based Analysis:
   - Identifies entries with matching BibTeX keys between the files
   - Checks if entries with matching keys have matching titles
   - Reports any cases where titles differ for the same key

2. Title-Based Analysis:
   - Identifies entries with matching titles between the files
   - Checks if entries with matching titles have matching BibTeX keys
   - Identifies and reports cases where matching titles appear multiple times in the main BibTeX file
   - Reports any cases where titles match but keys differ

The script expects two BibTeX files:
- Main BibTeX file: "1_Data/1_Bib/bib.bib"
- Reference BibTeX file: "3_Code/3_Python/1_Data/bib_rep_2022.bib"

The comparison is case-insensitive and ignores whitespace in titles for more robust matching.
Non-standard BibTeX entry types (e.g., 'online', 'patent') are supported.

Output includes:
- Statistics on the number of entries in each file
- Detailed reports of matches and mismatches for both analyses
- Information about duplicate titles in the main BibTeX file
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
    """Read BibTeX file and return entries as a dictionary with citation keys as keys."""
    parser = create_custom_parser()
    try:
        with open(file_path, 'r', encoding='utf-8') as bibtex_file:
            bib_database = bibtexparser.load(bibtex_file, parser=parser)
        
        # Convert to dictionary with citation keys as keys
        return {entry['ID']: entry for entry in bib_database.entries}
    except Exception as e:
        print(f"Error reading {file_path}: {e}")
        return {}

def normalize_title(title):
    """Normalize title for comparison by removing spaces, punctuation, and converting to lowercase."""
    if not title:
        return ""
    # Remove spaces and convert to lowercase
    return ''.join(title.lower().split())

def compare_by_keys(main_bib, reference_bib):
    """Compare entries based on matching bib keys."""
    matches = []
    title_mismatches = []
    
    for ref_key, ref_entry in reference_bib.items():
        if ref_key in main_bib:
            matches.append(ref_key)
            
            ref_title = normalize_title(ref_entry.get('title', ''))
            main_title = normalize_title(main_bib[ref_key].get('title', ''))
            
            if ref_title and main_title and ref_title != main_title:
                title_mismatches.append({
                    'key': ref_key,
                    'ref_title': ref_entry.get('title', ''),
                    'main_title': main_bib[ref_key].get('title', '')
                })
    
    return matches, title_mismatches

def find_duplicate_titles(bib_data):
    """Find titles that appear multiple times in a bib file."""
    title_map = defaultdict(list)
    
    # Map normalized titles to their entries
    for key, entry in bib_data.items():
        norm_title = normalize_title(entry.get('title', ''))
        if norm_title:
            title_map[norm_title].append((key, entry.get('title', '')))
    
    # Filter for titles that appear multiple times
    return {title: entries for title, entries in title_map.items() if len(entries) > 1}

def compare_by_titles(main_bib, reference_bib):
    """Compare entries based on matching titles and check for duplicates."""
    # Create title-to-entry mappings
    main_title_map = defaultdict(list)
    ref_title_map = defaultdict(list)
    
    # Build maps of normalized titles to entries
    for key, entry in main_bib.items():
        norm_title = normalize_title(entry.get('title', ''))
        if norm_title:
            main_title_map[norm_title].append((key, entry.get('title', '')))
            
    for key, entry in reference_bib.items():
        norm_title = normalize_title(entry.get('title', ''))
        if norm_title:
            ref_title_map[norm_title].append((key, entry.get('title', '')))
    
    # Find matching titles
    matching_titles = []
    key_mismatches = []
    duplicate_entries = {}
    
    for norm_title, ref_entries in ref_title_map.items():
        if norm_title in main_title_map:
            main_entries = main_title_map[norm_title]
            
            for ref_key, ref_original_title in ref_entries:
                matching_titles.append({
                    'title': ref_original_title,
                    'ref_key': ref_key,
                    'main_keys': [main_key for main_key, _ in main_entries]
                })
                
                # Check if keys match
                if not any(ref_key == main_key for main_key, _ in main_entries):
                    key_mismatches.append({
                        'title': ref_original_title,
                        'ref_key': ref_key,
                        'main_keys': [main_key for main_key, _ in main_entries]
                    })
                    
                    # If this title appears multiple times in main_bib, record it
                    if len(main_entries) > 1:
                        duplicate_entries[ref_original_title] = main_entries
    
    return matching_titles, key_mismatches, duplicate_entries

def main():
    # Define file paths
    cwd = Path.cwd()
    main_bib_path = cwd / "1_Data/1_Bib/bib.bib"
    
    # chose between 2022 and 2023
    # ref_bib_path = cwd / "3_Code/3_Python/1_Data/bib_rep_2022.bib"
    ref_bib_path = cwd / "3_Code/3_Python/1_Data/bib_rep_2023.bib"
    
    # Read both bib files
    print("Reading BibTeX files...")
    main_bib = read_bib_file(main_bib_path)
    ref_bib = read_bib_file(ref_bib_path)
    
    print(f"\nMain BibTeX file has {len(main_bib)} entries")
    print(f"Reference BibTeX file has {len(ref_bib)} entries")
    
    print("\n=== ANALYSIS 1: MATCHING BY BIB KEYS ===")
    # Compare by keys first
    matches, title_mismatches = compare_by_keys(main_bib, ref_bib)
    print(f"Found {len(matches)} matching citation keys")
    
    if not title_mismatches:
        print("All matching entries have matching titles!")
    else:
        print(f"\nFound {len(title_mismatches)} entries with same bib key but mismatching titles:")
        for mismatch in title_mismatches:
            print(f"\nCitation key: {mismatch['key']}")
            print(f"Reference title: {mismatch['ref_title']}")
            print(f"Main bib title: {mismatch['main_title']}")
    
    print("\n=== ANALYSIS 2: MATCHING BY TITLES ===")
    # Compare by titles
    matching_titles, key_mismatches, duplicate_entries = compare_by_titles(main_bib, ref_bib)
    print(f"Found {len(matching_titles)} matching titles")
    
    if len(duplicate_entries)>0:
        print("Note, found duplicated titles inside the Main bib. They will be outputed in detail further below inshallah")
    else:
        print("No duplicated titles found in Main bib")
    
    if not key_mismatches:
        print("All entries with matching titles have matching keys!")
    else:
        print(f"\nFound {len(key_mismatches)} entries with matching titles but different keys:")
        for mismatch in key_mismatches:
            print(f"\nTitle: {mismatch['title']}")
            print(f"Reference key: {mismatch['ref_key']}")
            print(f"Main bib key(s): {', '.join(mismatch['main_keys'])}")
            
            # Check if this title has duplicates in main_bib
            if mismatch['title'] in duplicate_entries:
                print("  NOTE: This title appears multiple times in the main bib file:")
                for main_key, main_title in duplicate_entries[mismatch['title']]:
                    print(f"    - Key: {main_key}")

if __name__ == "__main__":
    main()