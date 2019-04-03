#!/bin/sh

# OpenBOR only works with Pak files, if you have an extracted game you will need to create a pak first.
# There is a bug/annoyance with the master.cfg file, if its the first time running a game it will start in a small window.
# You will need to go into options and change the video to full, after you do this, that game will always run in fullscreen.
# You need to do this the first time you run any pak.
# If master.cfg does not work, sound is weird or controller not working, you will need to use a keyboard to set your gamepad
# after you set up your gamne, copy the /storage/.config/openbor/Saves/{gamename}.cfg file to /storage/.config/openbor/master.cfg
# master.cfg will only be copied the first time you run that particular game.

pakname=$(basename "$1")
pakname="${pakname%.*}"

echo $pakname
# Make sure the folders exists
	mkdir -p /storage/.config/openbor/Paks
	mkdir -p /storage/.config/openbor/Saves

# copy pak to Paks folder
	cp "$1" /storage/.config/openbor/Paks

# only copy master.cfg if its the first time running the pak
	if [ ! -f "/storage/.config/openbor/Saves/${pakname}.cfg" ]; then
		cp "/storage/.config/openbor/master.cfg" "/storage/.config/openbor/Saves/${pakname}.cfg"
	fi

# Run OpenBOR in the config folder
    cd /storage/.config/openbor/
	OpenBOR

# Delete Pak from temp folder
	rm -rf /storage/.config/openbor/Paks/*