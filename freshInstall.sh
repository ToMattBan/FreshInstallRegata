#!/bin/sh

# Prepatando Terreno
cd ~/Downloads

# Codium
sudo rpmkeys --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg

printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=gitlab.com_paulcarroty_vscodium_repo\nbaseurl=https://download.vscodium.com/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg\nmetadata_expire=1h" | sudo tee -a /etc/zypp/repos.d/vscodium.repo


# Yandex Disk
wget https://repo.yandex.ru/yandex-disk/yandex-disk-latest.x86_64.rpm
sudo rpm -i yandex-disk-latest.x86_64.rpm


# Plex
wget https://downloads.plex.tv/plex-media-server-new/1.25.6.5577-c8bd13540/redhat/plexmediaserver-1.25.6.5577-c8bd13540.x86_64.rpm
sudo rpm -i plexmediaserver-1.25.6.5577-c8bd13540.x86_64.rpm


# Telegram Desktop
wget https://updates.tdesktop.com/tlinux/tsetup.3.6.0.tar.xz
tar -xf tsetup.3.6.0.tar.xz

#sudo echo "[Desktop Entry]
#Name=Telegram
#GenericName=Mensageiro Instantâneo
#Keywords=telegram, mensagens, message;
#Exec=
#Terminal=false
#Type=Application
#Icon=~/.local/share/icons/telegram.png
#Categories=Development;Utilities;" > /usr/share/applications/telegram.desktop


# Montando HD Externo no ponto correto
echo "UUID=20927C1B927BF41E    ~/Externo/Games    ntfs    defaults,noatime 0 2" >> /etc/fstab
mkdir -p ~/Externo/Games
sudo mount /dev/sda2 ~/Externo/Games

# Criando SysLinks
ln -s ~/Externo/Games/Yandex.Disk/Linux/.thunderbird ~/.thunderbird
ln -s ~/Externo/Games/Yandex.Disk/Linux/.mozilla ~/.mozilla
ln -s ~/Externo/Games/Yandex.Disk/Linux/korganizer ~/.local/share/apps/korganizer
ln -s ~/Externo/Games/Yandex.Disk/Linux/latte ~/.config/latte
ln -s ~/Externo/Games/Yandex.Disk/Linux/.kde4 ~/.kde4

# Install apps
sudo zypper -y remove vlc
sudo zypper -y in git npm codium discord thunderbird chromium deezer celluloid latte-dock trello steam    korganizer koraganizer-lang mariadb appimaged akonadi-server akonadi-search

# Install yandex
yandex-disk setup

# Removing files unused
rm -rf yandex-disk-latest.x86_64.rpm tsetup.3.6.0.tar.xz plexmediaserver-1.25.6.5577-c8bd13540.x86_64.rpm
