#!/bin/bash

# Function to display ASCII art
display_ascii_art() {
    echo -e "\e[95m"
    echo "::::    ::: :::::::::   ::::::::   ::::::::   :::      "
    echo ":+:+:   :+: :+:    :+: :+:    :+: :+:    :+:  :+:      "
    echo ":+:+:+  +:+ +:+    +:+ +:+        +:+    +:+  +:+      "
    echo "+#+ +:+ +#+ +#++:++#+  +#++:++#++ +#+    +:+  +#+      "
    echo "+#+  +#+#+# +#+               +#+ +#+  # +#+  +#+      "
    echo "##+   #+#+# #+#        #+#    #+# #+#   +#+   #+#      "
    echo "###    #### ###         ########   ###### ### ##########"
    echo -e "\e[0m"
    echo "                    (Aurther Stone)"
    echo
}

# Function to scan ports for a given URL
scan_ports() {
    # Check if a URL is provided as an argument
    if [ -z "$1" ]; then
        echo "Usage: $0 <URL>"
        return
    fi

    url=$1

    # Perform port scanning
    echo "Scanning ports for $url..."

    for port in {1..65535}; do
        # Use netcat to attempt a connection to the specified port
        nc -z -w1 $url $port >/dev/null 2>&1

        # Check the exit status of the netcat command
        if [ $? -eq 0 ]; then
            echo "Port $port is open"
        fi
    done

    echo "Port scanning completed."
}

# Main menu
while true; do
    echo "Options:"
    echo "1. Scan Ports for a URL"
    echo "0. Exit"
    read -p "Choose an option: " option

    case $option in
        1)
            read -p "Enter the URL to scan: " url
            scan_ports "$url"
            ;;
        0)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid option. Please try again."
            ;;
    esac

done
