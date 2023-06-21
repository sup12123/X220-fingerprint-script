#!/bin/bash

# Check if fprint library is installed
if ! dpkg -s libfprint0 >/dev/null 2>&1; then
  echo "Please install the 'libfprint0' package to use the fingerprint scanner."
  exit 1
fi

# Check if fprint demo program is installed
if ! dpkg -s libfprint-demo >/dev/null 2>&1; then
  echo "Please install the 'libfprint-demo' package to use the fingerprint scanner."
  exit 1
fi

# Enroll a fingerprint
enroll_fingerprint() {
  fprint_demo_enroll
}

# Verify a fingerprint
verify_fingerprint() {
  fprint_demo_verify
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
