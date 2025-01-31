# Free Minecraft Server
This is a program that runs on Linux, I personally use Oracle Linux to run this, but anything can be used in this case as long as propper command infastructure is available. 

# System Requirements
4-5 G or more ram is optimal but more can be used for larger scale servers

# Steps
1. Install this file through wget or sftp
2. Give execute permessions if necessary with "chmod u+x LinuxServerInstall.sh"
3. Run it by doing ./LinuxServerInstall.sh
4. Wait for run script to be created, then run it by doing ./Run.sh
5. Play your server by typing in the ip adress of the hosting server
   
# Trouble Shooting
1. If you never set up a server before you may need to forward the minecraft port (25565) through the server's firewall to make it work
2. If you have a server directroy already you may need to rename or delete it for the script to work
3. If Java, Wget, or other nececairy archetecture for this to run, it will not work
4. Use the correct Java version for your Mineraft version Ex: Java 8 for 1.12 or Java 22 for 1.21 
