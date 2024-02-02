$projectName = Read-Host "Project Name"
if (-not $projectName) {
  Write-Host "Invalid Name!!!!"
} else {
  Write-Host "Creating a new React app with Vite"
  npm init vite@latest $projectName -- --template react

  # rename generated folder
  $newName = 'app'
  Rename-Item -Path $projectName -NewName $newName -Force
  Write-Host "Generated folder renamed to $newName."
  Write-Host "Initialization complete."

  # replace contents of App.jsx
  $appFilePath = "./app/src/App.jsx"
  $newAppContent = @"
import { useState } from 'react';
function App() {
  return (
    <>
      <h1>$projectName</h1>
    </>
  );
}
export default App;
"@
  Set-Content -Path $appFilePath -Value $newAppContent -Force
  Write-Host "Contents of App.jsx replaced."

  # replace contents of main.jsx
  $appFilePath = "./app/src/main.jsx"
  $newAppContent = @"
import React from 'react'
import ReactDOM from 'react-dom/client'
import App from './App.jsx'

ReactDOM.createRoot(document.getElementById('root')).render(
  <React.StrictMode>
    <App />
  </React.StrictMode>,
)
"@
  Set-Content -Path $appFilePath -Value $newAppContent -Force
  Write-Host "Contents of main.jsx replaced."


  # remove default vite stuff
  $filesToDelete = @(
    "./app/public/vite.svg",
    "./app/src/app.css",
    "./app/src/index.css"
  )

  $folderToDelete = "./app/src/assets"

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

  cd ./app
  npm install
  cls
  npm run dev
}
