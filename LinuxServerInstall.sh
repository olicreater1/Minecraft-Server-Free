#!/bin/bash
echo "Paste Link For Server Files:"
read link

# Create server directory
mkdir -p server
cd server

# Download the file
wget -O server.jar "$link"

# Check if the downloaded file is actually a JAR file
if file server.jar | grep -q 'Java archive'; then
    # Run the server to generate initial files
    java -jar server.jar -nogui

    # Accept the EULA
    echo "eula=true" > eula.txt

    # Create a run script
    echo "java -jar server.jar -nogui" > run.sh
    chmod +x run.sh

    # Clean up
    rm ../LinuxServerInstall.sh
else
    # Print error message if the file is not a valid JAR file
    echo "Error: The downloaded file is not a valid JAR file or download failed."
    cat server.jar # Display the contents of server.jar to debug the issue
    rm server.jar # Remove the invalid file
    exit 1
fi
