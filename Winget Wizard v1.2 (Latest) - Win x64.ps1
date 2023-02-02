# Function to display the menu and handle the user's selection
function Show-Menu {
    Clear-Host
    Write-Host "
     _       __    _                           __         _       __    _                             __
    | |     / /   (_)   ____    ____ _  ___   / /_       | |     / /   (_) ____  ____ _   _____  ____/ /
    | | /| / /   / /   / __ \  / __  `/ / _ \ / __/       | | /| / /   / / /_  / / __  `/  / ___/ / __  / 
    | |/ |/ /   / /   / / / / / /_/ / /  __// /_         | |/ |/ /   / /   / /_/ /_/ /  / /    / /_/ /  
    |__/|__/   /_/   /_/ /_/  \__, /  \___/ \__/         |__/|__/   /_/   /___/\__,_/  /_/     \__,_/   
                             /____/                                                                   " -ForegroundColor Blue
	Write-Host ""
    Write-Host "                                                  v1.0" -ForegroundColor DarkGray
	Write-Host "                                     ===== Available Options =====" -ForegroundColor Green
    # DISABLED Write-Host "1. Show installed apps"
    Write-Host "                                           1. Search for app"       -ForegroundColor Green
    Write-Host "                                           2. Install app"          -ForegroundColor Green
    Write-Host "                                           3. Uninstall app"        -ForegroundColor Green
    # DISABLED Write-Host "5. Show system's installed apps"
    Write-Host "                                           4. Exit"                 -ForegroundColor Green
	Write-Host "                                     =============================" -ForegroundColor Green
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
