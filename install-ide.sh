#!/bin/sh
set -ex

#
# VS Code
#
curl -s https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

sudo apt-get install -y apt-transport-https
sudo apt-get update
sudo apt-get install -y code # or code-insiders

#
# Sublime Text
#
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install -y apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install -y sublime-text


#
# Netbeans
#
# Netbeans 8.1 (bionic) / 10.0 (focal)
#sudo apt-get install -y netbeans

# Netbeans 8.2 installer (large download, so check if already installed).
# Was used for bionic.
# if [ ! -d "/usr/local/netbeans-8.2/" ]; then
# 	NB_INSTALLER=/tmp/netbeans-8.2-php-linux-x64.sh
# 	NB_TEMP=/tmp/netbeans-install
# 	wget --no-verbose -O $NB_INSTALLER https://download.netbeans.org/netbeans/8.2/final/bundles/netbeans-8.2-php-linux-x64.sh
# 	sudo chmod +x $NB_INSTALLER
#
# 	mkdir -p $NB_TEMP
# 	sudo $NB_INSTALLER --tempdir $NB_TEMP --nospacecheck --silent
# fi

# Netbeans 12
if [ ! -d "/usr/local/netbeans-12.0/" ]; then
	NB_INSTALLER=/tmp/netbeans-12.0-php-linux-x64.sh
	NB_TEMP=/tmp/netbeans-install
	# Was used in 18.04:
	wget --no-verbose -O $NB_INSTALLER https://www.apache.org/dyn/closer.cgi/netbeans/netbeans/12.0/Apache-NetBeans-12.0-bin-linux-x64.sh
	sudo chmod +x $NB_INSTALLER

	mkdir -p $NB_TEMP
	sudo $NB_INSTALLER --tempdir $NB_TEMP --nospacecheck --silent
fi
