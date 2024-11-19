#!/bin/bash
echo "Paste Link For Server Files:"
read link
mkdir -p server
cd server
wget -O server.jar "$link"

# Check if the downloaded file is actually a JAR file
if file server.jar | grep -q 'Java archive'; then
    java -jar server.jar -nogui
    echo "eula=true" > eula.txt
    echo "java -jar server.jar -nogui" > run.sh
    chmod +x run.sh
    rm ../LinuxServerInstall.sh
else
    echo "Error: The downloaded file is not a valid JAR file."
    rm server.jar
    exit 1
fi
