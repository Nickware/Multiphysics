# Script Install OpenModelica 
# Preparing installation and build Binaries
# Test in Deepin 15.10
# Autores: N.Torres
# naturalezacomputacional@gmail.com
# Version: 0.2
# Udpate: 13-06-2025

# Use the following lines in a shell to update your packages and install the certificate signing the OpenModelica packages

sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo curl -fsSL http://build.openmodelica.org/apt/openmodelica.asc | \
sudo gpg --dearmor -o /usr/share/keyrings/openmodelica-keyring.gpg

# Then update your sources.list using the lines below. Choose your CPU architecture, OS and preferred release branch to follow. If you are unsure, select the auto options and the stable release branch.

echo "deb [arch=amd64 signed-by=/usr/share/keyrings/openmodelica-keyring.gpg] \
  https://build.openmodelica.org/apt \
  $(cat /etc/os-release | grep "\(UBUNTU\\|DEBIAN\\|VERSION\)_CODENAME" | sort | cut -d= -f 2 | head -1) \
  stable" | sudo tee /etc/apt/sources.list.d/openmodelica.list

# Then update and install OpenModelica

sudo apt update
sudo apt install openmodelica

# For a smaller installation without graphical clients

sudo apt install --no-install-recommends omc

# Modelica libraries
# There is a package manager for Modelica libraries built into the scripting interface and the OMEdit graphical user interface

sudo apt install omlibrary

# C++ runtime
# The C++ runtime is an alternative to the default C runtime. To install the C++ runtime run this command

sudo apt install libomccpp
