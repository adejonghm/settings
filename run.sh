#!/bin/bash

##
##	Created by Alejandro de Jongh
##
##  Ubuntu 18.04-based script with XFCE desktop environment to install  
##  and configure the necessary software and packages in an automated way.
##
##	Contact:
##		e-mail: dejongh.cu@gmail.com
##		telegram: https://t.me/adejonghm
##
##
##	Before running this script, check the latest version of Telegram Desktop
##	and coreutils to set the TDESKTOP_VERSION and CUTILS_VERSION variables.
##


###### Setting variables
export TDESKTOP_VERSION=2.4.7			# Telegram Desktop version https://desktop.telegram.org/
export CUTILS_VERSION=8.32				# coreutils version https://ftp.gnu.org/gnu/coreutils/?C=M;O=D


###### Copying files into the HOME directory
mv -v .conkyrc .vimrc .zshrc .p10k.zsh $HOME/
mv -v templates/bash_template.sh templates/latex_cover_template.tex templates/python_template.py $HOME/Templates/


###### OS Installation
sudo bash scripts/os_install.sh


###### Python Installation
pip3 install --user wheel pylint pylama uncompyle6 isort fuzzywuzzy requests cookiecutter pulsectl tzlocal pycountry bs4 overrides colour lxml pipenv


###### Configurations
bash scripts/config.sh
