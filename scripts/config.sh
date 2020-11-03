#!/bin/bash


##### Telegram Desktop
wget -qc https://updates.tdesktop.com/tlinux/tsetup.$TDESKTOP_VERSION.tar.xz
tar -xf tsetup.$TDESKTOP_VERSION.tar.xz
rm -f tsetup.$TDESKTOP_VERSION.tar.xz


##### XFCE Globla Menu
# xfconf-query -c xsettings -p /Gtk/ShellShowsMenubar -n -t bool -s true
# xfconf-query -c xsettings -p /Gtk/ShellShowsAppmenu -n -t bool -s true


##### Advanced cp & mv command configuration (with progress-bar)
wget -qc http://ftp.gnu.org/gnu/coreutils/coreutils-$CUTILS_VERSION.tar.xz
tar -xJf coreutils-$CUTILS_VERSION.tar.xz
rm -f coreutils-$CUTILS_VERSION.tar.xz

cd coreutils-$CUTILS_VERSION/
wget -qc https://raw.githubusercontent.com/jarun/advcpmv/master/advcpmv-0.8-$CUTILS_VERSION.patch
patch -p1 -i advcpmv-0.8-$CUTILS_VERSION.patch
./configure
make


##### Copying files
sudo -- sh -c 'mv -vf Telegram/ /opt/telegram-desktop/; ln -sf /opt/telegram-desktop/Telegram /usr/bin/telegram'

sudo -- sh -c 'cp -vf src/cp /usr/bin/cp; cp -vf src/mv /usr/bin/mv'
cd ../ && rm -rf coreutils-$CUTILS_VERSION/


