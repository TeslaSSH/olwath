#!/bin/bash
# Author: voltsshx

command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# install Compiler
sudo apt install gcc >/dev/null 2>&1
# Check if the shc utility is installed
if ! command_exists shc; then
  echo "Error: shc utility is not installed."

  read -p "Do you want to install shc? (y/n): " install_choice

  if [[ "$install_choice" == "y" || "$install_choice" == "Y" ]]; then
    echo "You chose to install shc. Please install it using your package manager."
    sudo apt-get update
    sudo apt-get install shc -y
  else
    echo "Aborted. Please install shc manually and run the script again."
    exit 1
  fi
fi

if [[ "$#" -ne 1 ]]; then
  echo "Error: Script name is missing."
  echo "Usage: $0 <script_name>"
  exit 1
fi

script_name="$1"

if [[ ! -f "$script_name" ]]; then
  echo "Error: Script file '$script_name' does not exist."
  exit 1
fi

if [[ ! -x "$script_name" ]]; then
  echo "Error: Script file '$script_name' does not have execute permissions."
  exit 1
fi

shc -r -f "$script_name"

if [[ ! -f "${script_name}.x" ]]; then
  echo "Error: Failed to generate binary executable."
  exit 1
fi

echo "Binary executable '${script_name}.x' has been generated."
echo ""
