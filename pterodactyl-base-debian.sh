#!/bin/bash

echo "Starting the installation process..."

# Update package lists
echo "Updating package lists..."
apt update -y

# Install necessary packages
echo "Installing necessary packages..."
apt -y install software-properties-common curl ca-certificates gnupg2 sudo lsb-release

# Add repository for PHP
echo "Adding repository for PHP..."
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/sury-php.list
curl -fsSL https://packages.sury.org/php/apt.gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/sury-keyring.gpg

# Add repository for Redis
echo "Adding repository for Redis..."
curl -fsSL https://packages.redis.io/gpg | sudo gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/redis.list

# Update package lists
echo "Updating package lists again..."
apt update -y

# Install PHP and required extensions
echo "Installing PHP and required extensions..."
apt install -y php8.1 php8.1-{common,cli,gd,mysql,mbstring,bcmath,xml,fpm,curl,zip}

# MariaDB repo setup script
echo "Setting up MariaDB repository..."
curl -sS https://downloads.mariadb.com/MariaDB/mariadb_repo_setup | sudo bash

# Install the rest of dependencies
echo "Installing the rest of the dependencies..."
apt install -y mariadb-server nginx tar unzip git redis-server

# Install composer
echo "Installing Composer..."
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer

# Make download directory and change to it, download and extract files to current folder
echo "Downloading and extracting Pterodactyl..."
mkdir -p /var/www/pterodactyl
cd /var/www/pterodactyl
curl -Lo panel.tar.gz https://github.com/pterodactyl/panel/releases/latest/download/panel.tar.gz
tar -xzvf panel.tar.gz
chmod -R 755 storage/* bootstrap/cache/

# Tell the user the setup is complete and to move on to installing the database
echo "Setup completed without error, you can now move on to installing the database."
