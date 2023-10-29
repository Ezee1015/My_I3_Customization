REPO_DIR=~/github/My_I3_Customization
REPO_CONFIG_DIR=${REPO_DIR}/config
LOCAL_CONFIG_DIR=~/.config

CONFIG_FOLDERS=dunst rofi i3
PLUGIN_CONFIG_FILES=dunst/dunstrc rofi/config.rasi i3/i3blocks.conf i3/config i3/weather.sh i3/volControl.sh

APT_PACKAGES=i3-wm rofi i3lock feh numlockx lxappearance i3blocks pavucontrol dunst nm-tray perl lm-sensors thunar breeze-icon-theme ffmpeg scrot gvfs rofi-dev qalc libtool libxfixes-dev xsel
PACMAN_PACKAGES=i3-wm rofi i3lock feh numlockx lxappearance rofi-calc i3blocks pavucontrol dunst network-manager-applet perl lm-sensors thunar breeze-icons clipmenu ffmpeg scrot i3-scrot gvfs ttf-hack-nerd
ZYPPER_PACKAGES=

# Updates and install the lua files from the repository
install:
	@sudo apt install ${APT_PACKAGES} || \
	sudo pacman -S ${PACMAN_PACKAGES} || \
	sudo zypper install ${ZYPPER_PACKAGES}
	@cp -r ${REPO_CONFIG_DIR}/* ${LOCAL_CONFIG_DIR}/
	$(info Si es debian, ejecutar...)
	$(info )
	$(info sudo cp i3-scrot/i3-scrot /usr/bin/)
	# Clipnotify (dependencia de Clipmenu)
	$(info cd /tmp/ && git clone https://github.com/cdown/clipnotify && cd clipnotify && make && sudo make install)
	# ClipMenu
	$(info cd /tmp/ && git clone https://github.com/cdown/clipmenu && cd clipmenu && sudo make install)
	# Rofi-calc
	$(info cd /tmp/ && git clone https://github.com/svenstaro/rofi-calc.git && cd rofi-calc/ && mkdir m4 && autoreconf -i && mkdir build && cd build/ && ../configure && make && sudo make install)
	# Hack Font
	$(info wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Hack.zip)
	$(info sudo rm -r /usr/share/fonts/truetype/hack)
	$(info sudo mkdir /usr/share/fonts/truetype/hack && sudo tar -xf Hack.tar.xz -C /usr/share/fonts/truetype/hack)

# Updates and send to the repository the lua files
send:
	$(info Enviando...)
	# Elimina configuración del repo
	@rm -rf ${REPO_CONFIG_DIR}/*
	# Copia la configuración
	@for i in ${CONFIG_FOLDERS} ; do                               \
		LOCAL_FILE=${LOCAL_CONFIG_DIR}/$$i;                          \
		cp -r $$LOCAL_FILE ${REPO_CONFIG_DIR};                       \
	done

# Updates from the repository the lua files. DESTRUCTIVE!!!
update:
	$(info Actualizando...)
	# Elimina configuración local
	@for i in ${CONFIG_FOLDERS} ; do                               \
		LOCAL_FILE=${LOCAL_CONFIG_DIR}/$$i;                          \
		rm -r $$LOCAL_FILE;                                          \
	done
	# Copia la configuración
	@for i in ${CONFIG_FOLDERS} ; do                               \
		REMOTE_FILE=${REPO_CONFIG_DIR}/$$i;                          \
		cp -r $$REMOTE_FILE ${LOCAL_CONFIG_DIR};                     \
	done
