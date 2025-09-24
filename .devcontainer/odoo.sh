#!/bin/sh

python --version
pip --version

echo -e "\nPython, Pip version.\n"
read -p "Press enter to continue..."
echo -e "\n"

# Upgrade pip
pip install --upgrade pip

echo -e "\nUpgrading Python Pip\n"
read -p "Press enter to continue..."
echo -e "\n"

# Install the required Python packages
pip3 install --user -r ./odoo/requirements.txt
pip list

echo -e "\nInstalling Odoo required Python packages\n"
read -p "Press enter to continue..."
echo -e "\n"

# Done installing needed package(s)
echo "Done installating needed Python package(s) for Odoo....."