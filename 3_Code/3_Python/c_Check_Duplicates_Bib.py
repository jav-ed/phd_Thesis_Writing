import bibtexparser
from collections import defaultdict

from pathlib import Path

def read_bib_file(file_path):
    with open(file_path, 'r', encoding='utf-8') as bibtex_file:
        bib_database = bibtexparser.load(bibtex_file)
    return bib_database.entries

def find_duplicates(entries):
    name_dict = defaultdict(list)
    for entry in entries:
        # name = entry.get('ID', '').lower()  # Use 'ID' as the key, convert to lowercase
        name = entry.get('title', '').lower()  # Use 'ID' as the key, convert to lowercase
        name_dict[name].append(entry)
    
    duplicates = {name: entries for name, entries in name_dict.items() if len(entries) > 1}
    return duplicates

def print_duplicates(duplicates):
    if not duplicates:
        print("No duplicates found.")
    else:
        print("Duplicates found:")
        for name, entries in duplicates.items():
            print(f"\nDuplicate entries for '{name}':")
            for i, entry in enumerate(entries, 1):
                print(f"  Entry {i}:")
                print(f"    Title: {entry.get('title', 'N/A')}")
                print(f"    Author: {entry.get('author', 'N/A')}")
                print(f"    Year: {entry.get('year', 'N/A')}")

def main():
    cwd = Path.cwd()
    
    bib_file_path = cwd / "1_Data/1_Bib/bib.bib"  # Replace with your .bib file path
    
    entries = read_bib_file(bib_file_path)
    duplicates = find_duplicates(entries)
    print_duplicates(duplicates)

if __name__ == "__main__":
    main()