#!/bin/bash

echo "Checking for boot media"



AttemptSubBoot(){
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

cd "$parent_path"
#Pane is seen by System. Does it pass boot criteria?
#If so, perform the passoff and transition into Panes.
    file_exists_action2() {
    echo "The file exists! Performing the specified action..."
    bash BootFolder/Panes.sh
    # Add any commands you want to execute here
}

# Specify the file to check
FILE_PATH2="BootFolder/Installed"

# Check if the file exists
if [[ -e "$FILE_PATH" ]]; then
    file_exists_action2
else
    echo "You must insert a boot disk as no valid Operating System could be loaded at this time."
        echo "Additional Info: A Disk was present, but failed boot criteria."
fi
}

AttemptBoot2(){
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
BOOT_FOLDER="$SCRIPT_DIR/BootFolder"
SETUP_FILE="$BOOT_FOLDER/SetUp.sh"

#No Pane. Try booting another.
    file_exists_action3() {
    echo "The file exists! Performing the specified action..."
    bash BootFolder/SetUp.sh
    # Add any commands you want to execute here
}

# Specify the file to check
FILE_PATH2="BootFolder/SetUp.sh"

# Check if the file exists
    if [[ -e "$SETUP_FILE" ]]; then
    file_exists_action3
else
    echo "You must insert a boot disk as no valid Operating System could be loaded at this time."
fi
}
#AttemptBoot1(){
# Function to execute if the file exists
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

cd "$parent_path"
file_exists_action() {
    echo "The file exists! Performing the specified action..."
    AttemptSubBoot
    # Add any commands you want to execute here
}

# Specify the file to check
FILE_PATH="BootFolder/Panes.sh"

# Check if the file exists
if [[ -e "$FILE_PATH" ]]; then
    file_exists_action
else
    echo "No Bootfile on record. Checking for other boot media..."
    AttemptBoot2
fi
#}

