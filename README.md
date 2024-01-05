# Easy-BASH-Scripts
A collection of BASH scripts that install various software on Debian/Ubuntu based Linux distros.  

## How to use  
Download the script you need then set permissions. Probably best to create a folder for the scripts, also.  

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

docker-stack-install - install the latest Docker, Docker Compose v2 and Portainer.  
Oneliner installer 
```
curl -sSL https://raw.githubusercontent.com/dazeb/Easy-BASH-Scripts/main/docker-stack-install.sh -o docker-stack-install.sh
```

Profit.
