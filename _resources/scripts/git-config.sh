#! /usr/bin/env bash

# Prompt the user for their Git username and email
read -p "Enter your Git username: " username
read -p "Enter your Git email: " email

# Configure Git with the provided username and email
git config --global user.name "$username"
git config --global user.email "$email"

# Set core Git settings
git config --global core.eol lf
git config --global core.autocrlf input

# Set the default branch name to 'main' for new repositories
git config --global init.defaultBranch main

# Set the default web browser for Git to Firefox
git config --global web.browser firefox

# Output a completion message
echo "Git configuration completed!"

