echo Paste Link For Server Files
read link
mkdir server-$link
cd server-$link
wget $link
filename=$(find . -maxdepth 1 -name '.jar*')
java -jar $filename -nogui
echo eula=true > eula.txt
echo java -jar $filename -nogui > run.sh
rm LinuxServerInstall.sh
