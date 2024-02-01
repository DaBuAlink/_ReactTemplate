# React App Initialization Script with Vite

This script automates the process of initializing a new React app with Vite and performs additional cleanup steps to remove default Vite files and folders.

## Usage

1. **Run the Script:**

   - Open PowerShell.
   - Navigate to the directory where you want to create the React app.
   - Run the script by executing the following command:

     ```powershell
     .\init-react-vite.ps1
     ```

2. **Enter Project Name:**

   - When prompted, enter a name for your project.

3. **Initialization Process:**

   - The script will create a new React app using Vite, removing default Vite files and folders.
   - It will rename the generated folder to 'app'.

4. **Cleanup:**
   - The script deletes the following files and folders within the 'app' folder:
     - `app/public/vite.svg`
     - `app/src/app.css`
     - `app/src/index.css`
     - `app/src/assets` folder

## Requirements

- Node.js and npm installed on your machine.

## Notes

- Make sure to review and customize the script according to your specific needs.
- Test the script in a controlled environment before using it in a production setting.
