#!/bin/bash
echo "Paste Link For Server Files:"
read link

# Debug message to verify the link input
echo "Link provided: $link"

# Create server directory
mkdir -p server
cd server

# Download the file
wget -O server.jar "$link"

# Debug message to verify the download
if [ -f server.jar ]; then
    echo "Download successful: server.jar"
else
    echo "Error: Download failed. Check the link and try again."
    exit 1
fi

# Check if the downloaded file is actually a JAR file
if file server.jar | grep -q 'Java archive'; then
    echo "Valid JAR file detected."

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
