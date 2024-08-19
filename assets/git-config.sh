#!/bin/bash

# Function to set up .gitconfig with custom aliases, user details, and configurations
setup_gitconfig() {
    # Prompt for the user's name and email
    read -r "Enter your name: " username
    read -r "Enter your email: " email

    # Define the Git configurations
    cat <<EOL > ~/.gitconfig
[user]
    name = $username
    email = $email
[core]
    eol = lf
    autocrlf = input
[init]
    defaultBranch = main
EOL

    echo ".gitconfig setup completed."
}

# Run the setup function
setup_gitconfig
