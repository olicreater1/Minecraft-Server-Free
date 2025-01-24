#!/bin/bash

# Check if wget is installed
if ! command -v wget &> /dev/null; then
    echo "Error: wget is not installed. Please install wget and try again."
    exit 1
fi

# Check if Java is installed
if ! command -v java &> /dev/null; then
    echo "Error: Java is not installed. Please install Java and try again."
    exit 1
fi

echo "Paste Link For Server Files:"
read link

# Debug message to verify the link input
echo "Link provided: $link"

# Check if the link is not empty
if [ -z "$link" ]; then
    echo "Error: No link provided. Exiting."
    exit 1
fi

# Create server directory
mkdir -p server
cd server

# Download the file
wget -O server.jar "$link"
download_status=$?

# Debug message to verify the download
if [ $download_status -eq 0 ] && [ -f server.jar ]; then
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
    read -p "Accept EULA? (Y/N): " answer
    case $answer in
        [Yy]* ) echo "eula=true" > eula.txt;;
        [Nn]* ) echo "EULA Denied"; exit 1;;
        * ) echo "Invalid response. Exiting."; exit 1;;
    esac

    # Create a run script
    echo "#!/bin/bash" > run.sh
    echo "java -jar server.jar -nogui" >> run.sh
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
