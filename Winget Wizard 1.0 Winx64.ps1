# Function to display the menu and handle the user's selection
function Show-Menu {
    Clear-Host
    Write-Host "        Winget Wizard" -ForegroundColor Green
	Write-Host ""
	Write-Host "===== Available Options ====="
    # Write-Host "1. Show installed apps"
    Write-Host "1. Search for app"
    Write-Host "2. Install app"
    Write-Host "3. Uninstall app"
    # Write-Host "5. Show system's installed apps"
    Write-Host "4. Exit"
	Write-Host "============================="
	Write-Host ""
    $choice = Read-Host "Enter your choice (1-4)"

    switch ($choice) {
       # 1 {Show-InstalledApps }
        1 { Search-ForApp }
        2 { Install-App }
        3 { Uninstall-App }
       # 5 { Show-SystemApps }
        4 { Exit-Script }
        default { Write-Host "Invalid option, please try again." -ForegroundColor Red; Start-Sleep -Seconds 2; Show-Menu }
    }
}

# Function to show the installed apps
function Show-InstalledApps {
    winget list --global
    Write-Host "Press any key to continue" -ForegroundColor Green
    $null = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    Show-Menu
}

# Function to search for app
function Search-ForApp {
    $searchTerm = Read-Host "Enter the name of the app you want to search for"
    winget search $searchTerm --source winget
    Write-Host "Press any key to continue" -ForegroundColor Green
    $null = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    Show-Menu
}


# Function to handle install option
function Install-App {
    $installApp = Read-Host "Enter the name of the app you want to install"
    winget install $installApp
    Write-Host "Press any key to continue" -ForegroundColor Green
    $null = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    Show-Menu
}

# Function to handle uninstall option
function Uninstall-App {
    $uninstallApp = Read-Host "Enter the name of the app you want to uninstall"
    winget uninstall $uninstallApp
    Write-Host "Press any key to continue" -ForegroundColor Green
    $null = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    Show-Menu
}

# Function to show the system's installed apps
function Show-SystemApps {
    winget show system
    Write-Host "Press any key to continue" -ForegroundColor Green
    $null = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    Show-Menu
}

# Function to exit the script
function Exit-Script {
    Write-Host "Exiting..." -ForegroundColor Green
    Start-Sleep -Seconds 2
    exit
}

# Main code
Write-Host "Starting the app manager..." -ForegroundColor Green
Start-Sleep -Seconds 2
Clear-Host
Show-Menu
