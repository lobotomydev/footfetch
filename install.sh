#!/bin/bash

# Configuration
REPO_NAME="footfetch"
INSTALL_DIR="/usr/local/bin"
DOWNLOAD_URL="https://github.com/lobotomydev/footfetch/releases/download/1.0.0/footfetch"
TEMP_FILE="/tmp/$REPO_NAME"

# --- MAIN LOGIC ---

echo "Starting installation of $REPO_NAME"

# Check for curl
if ! command -v curl &> /dev/null; then
    echo "Error: curl is not installed. Please install it to continue."
    exit 1
fi

echo "Downloading package..."
curl -L -o "$TEMP_FILE" "$DOWNLOAD_URL"

if [ $? -ne 0 ]; then
    echo "Error: Failed to download the file from $DOWNLOAD_URL."
    exit 1
fi

echo "Installing the executable to $INSTALL_DIR..."
sudo mv "$TEMP_FILE" "$INSTALL_DIR/$REPO_NAME"

if [ $? -ne 0 ]; then
    echo "Error: Failed to move the executable. Check your permissions."
    exit 1
fi

# Make the executable runnable
sudo chmod +x "$INSTALL_DIR/$REPO_NAME"

echo "Installation of $REPO_NAME is complete! You can now run the program by typing '$REPO_NAME' in your terminal."