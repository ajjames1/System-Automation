$SourceDir = "C:\Users\YourUsername\Downloads" # Change this to your target folder

# Define categories and their extensions
$FileCategories = @{
    "Images" = @(".jpg", ".png", ".gif", ".bmp", ".svg")
    "Documents" = @(".pdf", ".docx", ".txt", ".xlsx", ".pptx")
    "Audio" = @(".mp3", ".wav", ".aac", ".flac")
    "Videos" = @(".mp4", ".mov", ".avi", ".mkv")
    "Archives" = @(".zip", ".rar", ".tar", ".gz")
    "Scripts" = @(".ps1", ".py", ".js", ".sh", ".bat")
}

# Create category folders if they don't exist
foreach ($category in $FileCategories.Keys) {
    $CategoryPath = "$SourceDir\$category"
    if (!(Test-Path $CategoryPath)) {
        New-Item -ItemType Directory -Path $CategoryPath
    }
}

# Move files to respective folders
Get-ChildItem -Path $SourceDir -File | ForEach-Object {
    $FileExt = $_.Extension
    foreach ($category in $FileCategories.Keys) {
        if ($FileExt -in $FileCategories[$category]) {
            Move-Item $_.FullName -Destination "$SourceDir\$category"
            Write-Output "Moved: $($_.Name) -> $category"
        }
    }
}

Write-Output "File organization complete!"