# Easy-BASH-Scripts
A collection of BASH scripts that install various software on Debian/Ubuntu based Linux distros.  

## How to use  
Download the script you need then set permissions. Probably best to create a folder for the scripts, also. 

## Example  

```
# Create folder and enter folder
mkdir bash-scripts && cd bash-scripts

# Download script as raw
wget https://raw.githubusercontent.com/dazeb/Easy-BASH-Scripts/main/docker-stack-install.sh

# Set Permissions
chmod +x docker-stack-install.sh

# Run the script
sh docker-stack-install.sh
```
## Added Scripts  

`docker-stack-install.sh` - install the latest Docker, Docker Compose v2 and Portainer.  

```
curl -sSL https://raw.githubusercontent.com/dazeb/Easy-BASH-Scripts/main/docker-stack-install.sh -o docker-stack-install.sh
```
`pterodactyl-base-debian.sh` - Pterdactyl base panel helper Debian 11/12 - Includes everything up to sql setup.  

When completed go here https://pterodactyl.io/panel/1.0/getting_started.html#installation  


Profit.
