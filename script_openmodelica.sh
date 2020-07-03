# Script Install OpenModelica 
# Preparing installation and build Binaries
# Test in Deepin 15.10
# Autores: N.Torres
# naturalezacomputacional@gmail.com
# Version: 0.0.1
# Udpate: 03-06-2020

# Copy and paste github OpenModelica
git clone --recursive https://openmodelica.org/git-readonly/OpenModelica.git OpenModelica
# Join up folder
cd OpenModelica/
# autoconfiguration
autoconf 
# Check requirements
./configure --with-cppruntime
# Building binaries
make -j4