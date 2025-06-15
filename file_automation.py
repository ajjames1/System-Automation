import os
import shutil

# Define source directory
source_dir = "C:/Users/YourUsername/Downloads"  # Change this to your target folder

# Define file categories
file_categories = {
    "Images": [".jpg", ".png", ".gif", ".bmp", ".svg"],
    "Documents": [".pdf", ".docx", ".txt", ".xlsx", ".pptx"],
    "Audio": [".mp3", ".wav", ".aac", ".flac"],
    "Videos": [".mp4", ".mov", ".avi", ".mkv"],
    "Archives": [".zip", ".rar", ".tar", ".gz"],
    "Scripts": [".py", ".js", ".sh", ".bat"]
}

# Create category folders if they don't exist
for category in file_categories.keys():
    category_path = os.path.join(source_dir, category)
    if not os.path.exists(category_path):
        os.makedirs(category_path)

# Organize files
for file in os.listdir(source_dir):
    file_path = os.path.join(source_dir, file)
    
    if os.path.isfile(file_path):  # Ignore directories
        file_ext = os.path.splitext(file)[1]
        
        for category, extensions in file_categories.items():
            if file_ext in extensions:
                shutil.move(file_path, os.path.join(source_dir, category, file))
                print(f"Moved: {file} -> {category}")

print("File organization complete!")