from bs4 import BeautifulSoup
from pathlib import Path


def adjust_svg_font_size(svg_path, scale_factor):
    # Read the SVG file
    with open(svg_path, 'r', encoding='utf-8') as file:
        svg_content = file.read()

    # Parse the SVG content
    soup = BeautifulSoup(svg_content, 'xml')

    # Find all text elements
    text_elements = soup.find_all('text')

    # Adjust the font size for each text element
    for element in text_elements:
        # Check if the 'font-size' attribute exists
        if 'font-size' in element.attrs:
            # Scale the font size
            current_size = float(element['font-size'].replace('px', ''))
            new_size = current_size * scale_factor
            element['font-size'] = f'{new_size}px'

    # Write the modified SVG content back to a new file
    with open(str(svg_path).replace('.svg', '_modified.svg'), 'w', encoding='utf-8') as file:
        file.write(str(soup))


cwd = Path.cwd()

# Path to your SVG file
svg_path = cwd/ 'Ca_0.0_15.00_CMU.svg'

# Scale factor for font size adjustment (e.g., 1.2 for a 20% increase)
scale_factor = 1.2

adjust_svg_font_size(svg_path, scale_factor)
