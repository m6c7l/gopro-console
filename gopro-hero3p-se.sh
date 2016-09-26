#!/bin/bash

#
# Copyright (c) 2016, Manfred Constapel
# This script is licensed under the terms of the MIT license.
#

RED='\033[0;41;30m'
STD='\033[0;0;39m'

# CONTROL : LOCATE

llMenu() {
	clear
	echo -e "\n Locate\n"
	echo " 1. On"
	echo " 2. Off"
	echo
	echo -e " 0. Return\n"
}

ll() {
	CMD="LL"
	local choice
	llMenu
	read -p " > " choice
	case ${choice} in
		1) OPT="01"; command ;;
		2) OPT="00"; command ;;
		0) ;;
		*) invalid; ll ;;
	esac
}

# CONTROL : RECORDING

pwMenu() {
	clear
	echo -e "\n Power\n"
	echo " 1. On"
	echo " 2. Off"
	echo
	echo -e " 0. Return\n"
}

pw() {
	APP="bacpac"
	CMD="PW"
	local choice
	pwMenu
	read -p " > " choice
	case ${choice} in
		1) OPT="01"; command ;;
		2) OPT="00"; command ;;
		0) ;;
		*) invalid; pw ;;
	esac
	APP="camera"
}

# CONTROL : RECORDING

shMenu() {
	clear
	echo -e "\n Recording\n"
	echo " 1. Start"
	echo " 2. Stop"
	echo
	echo -e " 0. Return\n"
}

sh() {
	CMD="SH"
	local choice
	shMenu
	read -p " > " choice
	case ${choice} in
		1) OPT="01"; command ;;
		2) OPT="00"; command ;;
		0) ;;
		*) invalid; sh ;;
	esac
}

# CONTROL

controlMenu() {
	clear
	echo -e "\n Control\n"
	echo " 1. Recording"
	echo " 2. Power"
	echo " 3. Locate"
	echo
	echo -e " 0. Return\n"
}

control() {
	local choice
	while true; do
		controlMenu
		read -p " > " choice
		case ${choice} in
			1) sh ;;
			2) pw ;;
			3) ll ;;
			0) break ;;
			*) invalid ;;
		esac
	done
}

# DELETE : DELETE LAST FILE

dl() {
	read -p " > Execute? [yn] " choice
	case ${choice} in
		y) CMD="DL"; OPT=""; command ;;
	esac
}

# DELETE : DELETE ALL FILES FROM SD CARD

da() {
	read -p " > Execute? [yn] " choice
	case ${choice} in
		y) CMD="DA"; OPT=""; command ;;
	esac
}

# DELETE

deleteMenu() {
	clear
	echo -e "\n Delete\n"
	echo " 1. Delete Last File"
	echo " 2. Delete all Files from SD Card"
	echo
	echo -e " 0. Return\n"
}

delete() {
	local choice
	while true; do
		deleteMenu
		read -p " > " choice
		case ${choice} in
			1) dl ;;
			2) da ;;
			0) break ;;
			*) invalid ;;
		esac
	done
}

# SETUP : MODE

cmMenu() {
	clear
	echo -e "\n Mode\n"
	echo " 1. Video"
	echo " 2. Still"
	echo " 3. Burst"
	echo " 4. Time Lapse"
	echo " 5. HDMI"
	echo
	echo -e " 0. Return\n"
}

cm() {
	CMD="CM"
	local choice
	cmMenu
	read -p " > " choice
	case ${choice} in
		1) OPT="00"; command ;;
		2) OPT="01"; command ;;
		3) OPT="02"; command ;;
		4) OPT="03"; command ;;
		5) OPT="05"; command ;;
		0) ;;
		*) invalid; cm ;;
	esac
}

# SETUP : SET DATE AND TIME

tm() {
	echo
	echo -n " Not implemented yet. "
	pause
}

# SETUP : NTSC/PAL

vmMenu() {
	clear
	echo -e "\n Video Region\n"
	echo " 1. NTSC"
	echo " 2. PAL"
	echo
	echo -e " 0. Return\n"
}

vm() {
	CMD="VM"
	local choice
	vmMenu
	read -p " > " choice
	case ${choice} in
		1) OPT="00"; command ;;
		2) OPT="01"; command ;;
		0) ;;
		*) invalid; vm ;;
	esac
}

# SETUP : DEFAULT AT POWER UP

dmMenu() {
	clear
	echo -e "\n Default at Power Up\n"
	echo " 1. Video"
	echo " 2. Photo"
	echo " 3. Burst"
	echo " 4. Time Lapse"
	echo
	echo -e " 0. Return\n"
}

dm() {
	CMD="DM"
	local choice
	dmMenu
	read -p " > " choice
	case ${choice} in
		1) OPT="00"; command ;;
		2) OPT="01"; command ;;
		3) OPT="02"; command ;;
		4) OPT="03"; command ;;
		0) ;;
		*) invalid; dm ;;
	esac
}

# SETUP : BEEP

bsMenu() {
	clear
	echo -e "\n Beep\n"
	echo " 1. Off"
	echo " 2. 70%"
	echo " 3. 100%"
	echo
	echo -e " 0. Return\n"
}

bs() {
	CMD="BS"
	local choice
	bsMenu
	read -p " > " choice
	case ${choice} in
		1) OPT="00"; command ;;
		2) OPT="01"; command ;;
		3) OPT="02"; command ;;
		0) ;;
		*) invalid; bs ;;
	esac
}

# SETUP : LED

lbMenu() {
	clear
	echo -e "\n LED\n"
	echo " 1. Off"
	echo " 2. 2"
	echo " 3. 4"
	echo
	echo -e " 0. Return\n"
}

lb() {
	CMD="LB"
	local choice
	lbMenu
	read -p " > " choice
	case ${choice} in
		1) OPT="00"; command ;;
		2) OPT="01"; command ;;
		3) OPT="02"; command ;;
		0) ;;
		*) invalid; lb ;;
	esac
}

# SETUP

setupMenu() {
	clear
	echo -e "\n Setup\n"
	echo " 1. LED"
	echo " 2. Beep"
	echo " 3. Default at Power Up"
	echo " 4. Video Region"
	echo " 5. Set Date and Time"
	echo " 6. Mode"
	echo
	echo -e " 0. Return\n"
}

setup() {
	local choice
	while true; do
		setupMenu
		read -p " > " choice
		case ${choice} in
			1) lb ;;
			2) bs ;;
			3) dm ;;
			4) vm ;;
			5) tm ;;
			6) cm ;;
			0) break ;;
			*) invalid ;;
		esac
	done
}

# CAPTURE SETTINGS : LOOPING VIDEO

loMenu() {
	clear
	echo -e "\n Looping Video\n"
	echo " 1. Off"
	echo " 2. 5 min"
	echo " 3. 20 min"
	echo " 4. 60 min"
	echo " 5. 120 min"
	echo " 6. Max"
	echo
	echo -e " 0. Return\n"
}

lo() {
	CMD="LO"
	local choice
	loMenu
	read -p " > " choice
	case ${choice} in
		1) OPT="00"; command ;;
		2) OPT="01"; command ;;
		3) OPT="02"; command ;;
		4) OPT="03"; command ;;
		5) OPT="04"; command ;;
		6) OPT="05"; command ;;
		0) ;;
		*) invalid; lo ;;
	esac
}

# CAPTURE SETTINGS : SPOT METER

exMenu() {
	clear
	echo -e "\n Spot Meter\n"
	echo " 1. On"
	echo " 2. Off"
	echo
	echo -e " 0. Return\n"
}

ex() {
	CMD="EX"
	local choice
	exMenu
	read -p " > " choice
	case ${choice} in
		1) OPT="01"; command ;;
		2) OPT="00"; command ;;
		0) ;;
		*) invalid; ex ;;
	esac
}

# CAPTURE SETTINGS : UPSIDE DOWN

upMenu() {
	clear
	echo -e "\n Upside Down\n"
	echo " 1. On"
	echo " 2. Off"
	echo
	echo -e " 0. Return\n"
}

up() {
	CMD="UP"
	local choice
	upMenu
	read -p " > " choice
	case ${choice} in
		1) OPT="01"; command ;;
		2) OPT="00"; command ;;
		0) ;;
		*) invalid; up ;;
	esac
}

# CAPTURE SETTINGS

captureMenu() {
	clear
	echo -e "\n Capture Settings\n"
	echo " 1. Upside Down"
	echo " 2. Spot Meter"
	echo " 3. Looping"
	echo
	echo -e " 0. Return\n"
}

capture() {
	local choice
	while true; do
		captureMenu
		read -p " > " choice
		case ${choice} in
			1) up ;;
			2) ex ;;
			3) lo ;;
			0) break ;;
			*) invalid ;;
		esac
	done
}

# CAMERA SETTINGS : VIDEO RESOLUTION

vvMenu() {
	clear
	echo -e "\n Video Resolution\n"
	echo " 1. 1080"
	echo " 2.  960"
	echo " 3.  720"
	echo " 4. WVGA"
	echo
	echo -e " 0. Return\n"
}

vv() {
	CMD="VV"
	local choice
	vvMenu
	read -p " > " choice
	case ${choice} in
		1) OPT="03"; command ;;
		2) OPT="02"; command ;;
		3) OPT="01"; command ;;
		4) OPT="00"; command ;;
		0) ;;
		*) invalid; vv ;;
	esac
}

# CAMERA SETTINGS : FRAME RATE

fsMenu() {
	clear
	echo -e "\n NTSC/PAL Frame Rate (Video Resolutions)\n"
	echo " 1.  30/ 25 (1080, 960, 720,     )"
	echo " 2.  60/ 50 (1080, 960, 720, WVGA)"
	echo " 3. 120/100 (           720, WVGA)"
	echo
	echo -e " 0. Return\n"
}

fs() {
	CMD="FS"
	local choice
	fsMenu
	read -p " > " choice
	case ${choice} in
		1) OPT="04"; command ;;
		2) OPT="07"; command ;;
		3) OPT="09"; command ;;
		0) ;;
		*) invalid; fs ;;
	esac
}

# CAMERA SETTINGS : FIELD OF VIEW

fvMenu() {
	clear
	echo -e "\n Field of View\n"
	echo " 1. Wide   (1080, 960, 720, WVGA)"
	echo " 2. Medium (1080,      720,     )"
	echo " 3. Narrow (1080,      720,     )"
	echo
	echo -e " 0. Return\n"
}

fv() {
	CMD="FV"
	local choice
	fvMenu
	read -p " > " choice
	case ${choice} in
		1) OPT="00"; command ;;
		2) OPT="01"; command ;;
		3) OPT="02"; command ;;
		0) ;;
		*) invalid; fv ;;
	esac
}

# CAMERA SETTINGS : PHOTO RESOLUTION

prMenu() {
	clear
	echo -e "\n Photo Resolution\n"
	echo " 1. 10 MP"
	echo " 2.  7 MP"
	echo " 3.  5 MP"
	echo
	echo -e " 0. Return\n"
}

pr() {
	CMD="PR"
	local choice
	prMenu
	read -p " > " choice
	case ${choice} in
		1) OPT="08"; command ;;
		2) OPT="04"; command ;;
		3) OPT="03"; command ;;
		0) ;;
		*) invalid; pr ;;
	esac
}

# CAMERA SETTINGS : BURST RATE

buMenu() {
	clear
	echo -e "\n Burst Rate\n"
	echo " 1.  3/1s"
	echo " 2.  5/1s"
	echo " 3. 10/1s"
	echo
	echo -e " 0. Return\n"
}

bu() {
	CMD="BU"
	local choice
	buMenu
	read -p " > " choice
	case ${choice} in
		1) OPT="00"; command ;;
		2) OPT="01"; command ;;
		3) OPT="02"; command ;;
		0) ;;
		*) invalid; bu ;;
	esac
}

# CAMERA SETTINGS : TIME LAPSE

tiMenu() {
	clear
	echo -e "\n Time Lapse\n"
	echo " 1.  0.5s"
	echo " 2.  1s"
	echo " 3.  2s"
	echo " 4.  5s"
	echo " 5. 10s"
	echo " 6. 30s"
	echo " 7. 60s"
	echo
	echo -e " 0. Return\n"
}

ti() {
	CMD="TI"
	local choice
	tiMenu
	read -p " > " choice
	case ${choice} in
		1) OPT="00"; command ;;
		2) OPT="01"; command ;;
		3) OPT="02"; command ;;
		4) OPT="05"; command ;;
		5) OPT="0A"; command ;;
		6) OPT="1E"; command ;;
		7) OPT="3C"; command ;;
		0) ;;
		*) invalid; ti ;;
	esac
}

# CAMERA SETTINGS

cameraMenu() {
	clear
	echo -e "\n Camera Settings\n"
	echo " 1. Video Resolution"
	echo " 2. Frame Rate"
	echo " 3. Field of View"
	echo " 4. Photo Resolution"
	echo " 5. Burst Rate"
	echo " 6. Time Lapse"
	echo
	echo -e " 0. Return\n"
}

camera() {
	local choice
	while true; do
		cameraMenu
		read -p " > " choice
		case ${choice} in
			1) vv ;;
			2) fs ;;
			3) fv ;;
			4) pr ;;
			5) bu ;;
			6) ti ;;
			0) break ;;
			*) invalid ;;
		esac
	done
}

# MAIN

gpMediaList() {
	echo
	echo -ne $(curl -s -m 2 "http://10.5.5.9:8080/gp/gpMediaList") | \
		sed -e "s/\[{/\[{\n/g" | \
		sed -e "s/\,{/,{\n/g" | \
		sed -e "s/\"d\"/  \"d\"/g" | \
		sed -e "s/\"n\"/    \"n\"/g"
	read -rsp $'' -n1 key
}

cv() {
	echo
	echo -ne $(curl -s -m 2 "http://10.5.5.9/camera/cv") | \
		sed -e "s/[\o0\o1\o2\o3\o4\o5\o6\o7\o10]//g" | \
		sed -e "s/[\o25]/\n/g" | \
		sed -e 's/^[[:space:]]*//'
	echo
	echo
	echo -ne $(curl -s -m 2  "http://10.5.5.9/bacpac/cv") | \
		sed -e "s/[\o0\o1\o2\o3\o4\o5\o6\o7\o10]//g" | \
		sed -e "s/[\o25]/\n/g" | \
		sed -e 's/^[[:space:]]*//'
	read -rsp $'' -n1 key
}

mainMenu() {
	clear
	echo -e "\n GoPro HERO3+ Silver Edition\n"
	echo " 1. Camera Settings"
	echo " 2. Capture Settings"
	echo " 3. Setup"
	echo " 4. Delete"
	echo " 6. Info"
	echo " 7. Media List"
	echo " 8. Control"
	echo " 9. Preview"
	echo
	echo -e " 0. Exit\n"
}

main() {
	APP="camera"
	local choice
	while true; do
		mainMenu
		read -p " > " choice
		case ${choice} in
			1) camera ;;
			2) capture ;;
			3) setup ;;
			4) delete ;;
			6) cv ;;
			7) gpMediaList ;;
            8) control ;;
            9) preview ;;
			0) exit 0 ;;
			*) invalid ;;
		esac
	done
}

command() {
	PARA=""
	if [[ -n ${OPT} ]]; then
		PARA="&p=%"${OPT}
	fi
	echo -ne $(curl -s -m 2 "http://10.5.5.9/${APP}/${CMD}?t=${PASS}${PARA}") | \
		sed -e "s/[\o0\o1\o2\o3\o4\o5\o6\o7\o10]//g" | \
		sed -e "s/[\o25]/\n/g" | \
		sed -e 's/^[[:space:]]*//'
	echo -ne "\n ${APP}/${CMD}?t=${PASS}${PARA} "
	pause
}

pause() {
	sleep 1.5
}

invalid() {
	echo -ne "\n ${RED}invalid${STD} " && sleep 1
}

preview() {
	CMD="PV"
	name=$(echo "$0" | awk -F'/' '{print $NF}')
	bash $name preview &
	OPT="02"; command
	echo -ne "\n streaming http://10.5.5.9:8080/live/amba.m3u8 "
	read -rsp $'' -n1 key
	echo
	OPT="00"; command
	kill -9 $(ps aux | grep "$name preview" | grep -v root | awk "{print $2}") &> /dev/null
	(( $? == 0)) && echo -ne "\n stream closed ";
	pause
}

PASS=$(curl -s -m 3 "http://10.5.5.9/bacpac/sd" | sed -e "s/[\o0\o1\o2\o3\o4\o5\o6\o7\o10]//g")
if [[ -z ${PASS} ]]; then
	echo "GoPro not connected!"
	exit 1
fi

if [[ $# == 0 ]]; then

	trap '' SIGINT SIGQUIT SIGTSTP
	main

else # PREVIEW

	while true; do
	  # GoPro 3 (keep alive)
	  curl -s -m 1 "http://10.5.5.9/camera/se?t=${PASS}" &>/dev/null
	  sleep 2.5
	done

fi

