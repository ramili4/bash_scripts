#!/bin/bash

# Prompt the user to enter a port number
read -p "Enter a port number: " port_number

# Validate that a port number is provided
if [[ ! $port_number =~ ^[0-9]+$ ]]; then
  echo "Invalid port number. Please enter a valid numeric port."
  exit 1
fi

# Use lsof to find the process using the specified port
result=$(lsof -i :$port_number)

# Check if lsof found any results
if [ -z "$result" ]; then
  echo "No service found using port $port_number."
else
  echo "Service(s) using port $port_number:"
  echo "$result"

  # Prompt the user to disable the service
  read -p "Do you want to disable the service using this port? (y/n): " response
  if [ "$response" = "y" ] || [ "$response" = "Y" ]; then
    # Assuming the service is managed by systemd, stop the service
    sudo systemctl stop $(echo "$result" | awk 'NR==2{print $2}')
    echo "Service stopped."
  else
    echo "Service not disabled."
  fi
fi

