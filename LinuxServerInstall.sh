#!/bin/bash
echo "Paste Link For Server Files:"
read link
mkdir -p server
cd server
wget "$link"
filename=$(find . -maxdepth 1 -name '*.jar')
java -jar "$filename" -nogui
echo "eula=true" > eula.txt
echo "java -jar $filename -nogui" > run.sh
chmod +x run.sh
rm ../LinuxServerInstall.sh
