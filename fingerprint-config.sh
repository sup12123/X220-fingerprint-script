#!/bin/bash

# Check if fprintd package is installed
if ! dpkg -s fprintd >/dev/null 2>&1; then
  echo "Installing required packages..."
  sudo apt update
  sudo apt install -y fprintd
fi

# Enroll a fingerprint
enroll_fingerprint() {
  fprintd-enroll
}

# Verify a fingerprint
verify_fingerprint() {
  fprintd-verify
}

# Main menu
while true; do
  clear
  echo "Fingerprint Scanner Utility"
  echo "---------------------------"
  echo "1. Enroll a fingerprint"
  echo "2. Verify a fingerprint"
  echo "0. Exit"
  read -p "Enter your choice: " choice

  case $choice in
    1) enroll_fingerprint ;;
    2) verify_fingerprint ;;
    0) exit 0 ;;
    *) echo "Invalid choice. Please try again." ;;
  esac

  read -n 1 -s -r -p "Press any key to continue..."
done
