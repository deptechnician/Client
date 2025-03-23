#!/bin/bash

# Make sure you at least of the person name
if [ $# -lt 1 ]; then
    echo " "
    echo " Usage: $0 <Profile> [Backup_path]"
    echo ""
    echo "   Profiles:"
    find ~/.DEP/*.conf -type f -exec basename {} \; | sed 's/\.[^.]*$//' | awk '{print "\t" $0}'
    echo " "
    echo "LOCAL_NAS in the profile is the default Backup_path"
    echo " "
    exit 
fi

PROFILE_NAME=$1
CONFIG_FILE="$HOME/.DEP/$PROFILE_NAME.conf"

# Check if the configuration file exists
if [ ! -f "$CONFIG_FILE" ]; then
    echo "Configuration file for '$PROFILE_NAME' does not exist: $CONFIG_FILE"
    exit 
fi

# Load configuration from the file
source "$CONFIG_FILE"

# Validate necessary variables in the config file
if [ -z "$PROFILE_PATH" ] || [ -z "$BACKUP_FOLDERS" ] || [ -z "$LOCAL_NAS" ]; then
    echo "Error: Missing required parameters (PROFILE_PATH, LOCAL_NAS, or BACKUP_FOLDERS) in the configuration file."
    exit 
fi

# Assign the BACKUP_PATH
echo "$LOCAL_NAS"
BACKUP_PATH=$LOCAL_NAS
if [ $# -ge 2 ]; then
    BACKUP_PATH=$2
fi
echo "The backup path will be: $BACKUP_PATH"

# Loop through the list of folders to back up
IFS='|' # Use pipe (|) as the delimiter for folder names
for FOLDER in $BACKUP_FOLDERS; do
    FOLDER_PATH="$PROFILE_PATH/$FOLDER"

    # Check if the folder exists
    if [ ! -d "$FOLDER_PATH" ]; then
        echo "Warning: Folder '$FOLDER_PATH' does not exist. Skipping."
        continue
    fi

    # Backup the folder (this is an expansion of the syncup alias, mirrors the source into the destination)
    echo "Backing up '$FOLDER_PATH' to '$BACKUP_PATH'..."
    rsync -avzP --delete "$FOLDER_PATH" "$BACKUP_PATH"
done

echo "Backup completed for $PROFILE_NAME."
exit 0
