# PowerShell script to initialize a React app with Vite

$projectName = Read-Host "Project Name"
if (-not $projectName) {
  Write-Host "Invalid Name!!!!"
} else {
Write-Host "Creating a new React app with Vite"
npm init vite@latest $projectName -- --template react


# remove default vite stuff
$filesToDelete = @(
  "$newName/public/vite.svg",
  "$newName/src/app.css",
  "$newName/src/index.css"
  )

$folderToDelete = "$newName/src/assets"

foreach ($file in $filesToDelete) {
  if (Test-Path $file) {
    Remove-Item $file -Force
    Write-Host "Deleted file: $file"
  } else {
    Write-Host "File not found: $file"
  }
}

if (Test-Path $folderToDelete) {
  Remove-Item $folderToDelete -Recurse -Force
  Write-Host "Deleted folder: $folderToDelete"
} else {
  Write-Host "Folder not found: $folderToDelete"
}

# rename generated folder
  $newName = 'app'
  Rename-Item -Path $projectName -NewName $newName -Force
  Write-Host "Generated folder renamed to $newName."
  Write-Host "Initialization complete."
}
