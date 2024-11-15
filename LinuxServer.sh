echo Paste Link For Server Files
read link
mkdir server
cd server
wget $link
filename=$(find . -maxdepth 1 -name '.jar*')
java -jar $filename -nogui
