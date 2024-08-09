import pathlib
import shutil
import subprocess

inp_Parent_Fold = "/mnt/lft/lft_home/intern/P_Projekte/2022/2022_K2H2/3_Berichte/4_Zwischenbericht_2023/0_Jav/0_Init/1_Data/2_Figures/1_Ch_Figs/0_Ch/"

# inp_Ct_Fold = "6_Style_2_Curv"
# inp_Ct_Fold = "7_Style_1_Zoom"
# inp_Ct_Fold = "8_Style_2_Zoom"
# inp_Ct_Fold = "9_Mean_Disp_Meth_2"
# inp_Ct_Fold = "10_Impact_Meth_2_Kap"
inp_Ct_Fold = "11_Impact_Meth_2_U"


# Convert input path to a pathlib.Path object
ct_Path = pathlib.Path(inp_Parent_Fold)
ct_Path = ct_Path / inp_Ct_Fold

# Check if the backup folder exists, if not, create it
backup_path = ct_Path / 'Backup'
if not backup_path.exists():
    backup_path.mkdir()

    # Copy all files in the input path to the backup folder
    for item in ct_Path.iterdir():
        if item.is_file():
            shutil.copy(item, backup_path)

# For each .png file, run the ffmpeg command, delete the original, and rename the output
for item in ct_Path.glob('*.png'):
    output_file = ct_Path / 'output.png'
    command = [
        'ffmpeg', 
        '-i', str(item), 
        '-vf', 'crop=in_w:in_h-(in_h*0.17):0:in_h*0.07', 
        str(output_file)
    ]
    
    # Run the ffmpeg command
    subprocess.run(command, check=True)
    
    # Delete the original file
    item.unlink()
    
    # Rename the output file to the original file name
    output_file.rename(item)

print("Processing completed.")
