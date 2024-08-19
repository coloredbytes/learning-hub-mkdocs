# Function to set up .gitconfig with user details and core configurations
function Setup-GitConfig {
    # Prompt for the user's name and email
    $username = Read-Host "Enter your name"
    $email = Read-Host "Enter your email"

    # Define the Git configurations
    $gitConfigContent = @"
[user]
    name = $username
    email = $email
[core]
    eol = lf
    autocrlf = input
[init]
    defaultBranch = main
"@

    # Write the configurations to the .gitconfig file
    $gitConfigPath = "$HOME\.gitconfig"
    $gitConfigContent | Out-File -FilePath $gitConfigPath -Encoding UTF8

    Write-Host ".gitconfig setup completed."
}

# Run the setup function
Setup-GitConfig
