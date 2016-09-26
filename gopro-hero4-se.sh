#!/bin/bash

#
# Copyright (c) 2016, Manfred Constapel
# This script is licensed under the terms of the MIT license.
#

RED='\033[0;41;30m'
STD='\033[0;0;39m'

# 1) VIDEO SETTINGS

videoMenu() {
	clear
	echo -e "\n Video Settings\n"
	echo " 1. Resolution"
	echo " 2. Frame Rate"
	echo " 3. Field of View"
	echo " 4. Low Light"
	echo " 5. Spot Meter"
	echo " 6. Protune"
	echo
	echo -e " 0. Return\n"
}

video() {
	local choice
	while true; do
		videoMenu
		read -p " > " choice
		case ${choice} in
			1) vres ;;
			2) vfps ;;
			3) vfov ;;
			4) vlol ;;
			5) vspo ;;
			6) vpro ;;
			0) break ;;
			*) invalid ;;
		esac
	done
}

# 1.1) RESOLUTION

vresMenu() {
	clear
	echo -e "\n Resolution\n"
	echo " 1.   4K"
	echo " 2.   2K7"
	echo " 3. 1140"
	echo " 4. 1080SV"
	echo " 5. 1080"
	echo " 6.  960"
	echo " 7.  720SV"
	echo " 8.  720"
	echo " 9. WVGA"
	echo
	echo -e " 0. Return\n"
}

vres() {
	PRE="setting/2/"
	local choice
	vresMenu
	read -p " > " choice
	case ${choice} in
		1) SUF="1"; command ;;
		2) SUF="4"; command ;;
		3) SUF="7"; command ;;
		4) SUF="8"; command ;;
		5) SUF="9"; command ;;
		6) SUF="10"; command ;;
		7) SUF="11"; command ;;
		8) SUF="12"; command ;;
		9) SUF="13"; command ;;
		0) ;;
		*) invalid; vres ;;
	esac
}

# 1.2) FPS

vfpsMenu() {
	clear
	echo -e "\n NTSC/PAL Frame Rate\n"
	echo "      15/ 12.5 (                                              4K)"
	echo " 1.   24       (                      1080, 1080SV, 1440, 2K7   )"
	echo " 2.   30/ 25   (     720,             1080, 1080SV, 1440, 2K7   )"
	echo " 3.   48       (                      1080, 1080SV, 1440        )"
	echo " 4.   60/ 50   (     720, 720SV, 960, 1080, 1080SV              )"
	echo " 5.  100       (     720, 720SV, 960,                           )"
	echo " 6.  120       (     720,                                       )"
	echo "     240       (WVGA                                            )"
	echo
	echo -e " 0. Return\n"
}

vfps() {
	PRE="setting/3/"
	local choice
	vfpsMenu
	read -p " > " choice
	case ${choice} in
		1) SUF="10"; command ;;
		2) SUF="8"; command ;;
		3) SUF="7"; command ;;
		4) SUF="5"; command ;;
		5) SUF="2"; command ;;
		6) SUF="1"; command ;;
		0) ;;
		*) invalid; vfps ;;
	esac
}

# 1.3) FOV

vfovMenu() {
	clear
	echo -e "\n Field of View\n"
	echo " 1. Wide   (4K, 2K7, 1440, 1080SV, 1080, 960, 720SV, 720, WVGA)"
	echo " 2. Medium (    2K7,               1080,             720,     )"
	echo " 3. Narrow (                       1080,             720,     )"
	echo
	echo -e " 0. Return\n"
}

vfov() {
	PRE="setting/4/"
	local choice
	vfovMenu
	read -p " > " choice
	case ${choice} in
		1) SUF="0"; command ;;
		2) SUF="1"; command ;;
		3) SUF="2"; command ;;
		0) ;;
		*) invalid; vfov ;;
	esac
}

# 1.4) LOW LIGHT

vlolMenu() {
	clear
	echo -e "\n Low Light\n"
	echo " 1. On"
	echo " 2. Off"
	echo
	echo -e " 0. Return\n"
}

vlol() {
	PRE="setting/8/"
	local choice
	vlolMenu
	read -p " > " choice
	case ${choice} in
		1) SUF="1"; command ;;
		2) SUF="0"; command ;;
		0) ;;
		*) invalid; vlol ;;
	esac
}

# 1.5) SPOT METER

vspoMenu() {
	clear
	echo -e "\n Spot Meter\n"
	echo " 1. On"
	echo " 2. Off"
	echo
	echo -e " 0. Return\n"
}

vspo() {
	PRE="setting/9/"
	local choice
	vspoMenu
	read -p " > " choice
	case ${choice} in
		1) SUF="1"; command ;;
		2) SUF="0"; command ;;
		0) ;;
		*) invalid; vspo ;;
	esac
}

# 1.6) PROTUNE

vproMenu() {
	clear
	echo -e "\n Protune\n"
	echo " 1. On"
	echo " 2. Off"
	echo " 3. White Balance"
	echo " 4. Color"
	echo " 5. Manual Exposure"
	echo " 6. ISO Limit"
	echo " 7. Sharpness"
	echo " 8. EV Compensation"
	echo " 9. Reset Protune"
	echo
	echo -e " 0. Return\n"
}

vpro() {
	local choice
	while true; do	
		PRE="setting/10/"
		vproMenu
		read -p " > " choice
		case ${choice} in
			1) SUF="1"; command ;;
			2) SUF="0"; command ;;
			3) vprowb ;;
			4) vproco ;;
			5) vprome ;;
			6) vproil ;;
			7) vprosh ;;
			8) vproev ;;
			9) PRE=""; SUF="command/video/protune/reset"; command ;;
			0) break ;;
			*) invalid ;;
		esac
	done	
}

# 1.6.1) WHITE BALANCE

vprowbMenu() {
	clear
	echo -e "\n White Balance\n"
	echo " 1. Auto"
	echo " 2. 3000K"
	echo " 3. 4000K"
	echo " 4. 4800K"
	echo " 5. 5500K"
	echo " 6. 6000K"
	echo " 7. 6500K"
	echo " 8. Native"
	echo
	echo -e " 0. Return\n"
}

vprowb() {
	PRE="setting/11/"
	local choice
	vprowbMenu
	read -p " > " choice
	case ${choice} in
		1) SUF="0"; command ;;
		2) SUF="1"; command ;;
		3) SUF="5"; command ;;
		4) SUF="6"; command ;;
		5) SUF="2"; command ;;
		6) SUF="7"; command ;;
		7) SUF="3"; command ;;
		8) SUF="4"; command ;;
		0) ;;
		*) invalid; vprowb ;;
	esac
}

# 1.6.2) COLOR

vprocoMenu() {
	clear
	echo -e "\n Color\n"
	echo " 1. GoPro Color"
	echo " 2. Flat"
	echo
	echo -e " 0. Return\n"
}

vproco() {
	PRE="setting/12/"
	local choice
	vprocoMenu
	read -p " > " choice
	case ${choice} in
		1) SUF="0"; command ;;
		2) SUF="1"; command ;;
		0) ;;
		*) invalid; vproco ;;
	esac
}

# 1.6.3) MANUAL EXPOSURE

vpromeMenu() {
	clear
	echo -e "\n Exposure\n"
	echo " 1. Auto"
	echo " 2. 1/(1x FPS)"
	echo " 3. 1/(2x FPS)"
	echo " 4. 1/(4x FPS)"
	echo
	echo -e " 0. Return\n"
}

vprome() {
	#PRE="setting/73/"
	echo
	echo -n " Not implemented yet. "
	pause
}

# 1.6.4) ISO LIMIT

vproilMenu() {
	clear
	echo -e "\n ISO Limit\n"
	echo " 1. 6400"
	echo " 2. 3200"
	echo " 3. 1600"
	echo " 4. 800"
	echo " 5. 400"
	echo
	echo -e " 0. Return\n"
}

vproil() {
	PRE="setting/13/"
	local choice
	vproilMenu
	read -p " > " choice
	case ${choice} in
		1) SUF="0"; command ;;
		2) SUF="3"; command ;;
		3) SUF="1"; command ;;
		4) SUF="4"; command ;;
		5) SUF="2"; command ;;
		0) ;;
		*) invalid; vproil ;;
	esac
}

# 1.6.5) SHARPNESS

vproshMenu() {
	clear
	echo -e "\n Sharpness\n"
	echo " 1. High"
	echo " 2. Medium"
	echo " 3. Low"
	echo
	echo -e " 0. Return\n"
}

vprosh() {
	PRE="setting/14/"
	local choice
	vproshMenu
	read -p " > " choice
	case ${choice} in
		1) SUF="0"; command ;;
		2) SUF="1"; command ;;
		3) SUF="2"; command ;;
		0) ;;
		*) invalid; vprosh ;;
	esac
}

# 1.6.6) EV COMPENSATION

vproevMenu() {
	clear
	echo -e "\n EV Compensation\n"
	echo " 1. +2.0"
	echo " 2. +1.5"
	echo " 3. +1.0"
	echo " 4. +0.5"
	echo " 5.  0.0"
	echo " 6. -0.5"
	echo " 7. -1.0"
	echo " 8. -1.5"
	echo " 9. -2.0"
	echo
	echo -e " 0. Return\n"
}

vproev() {
	PRE="setting/15/"
	local choice
	vproevMenu
	read -p " > " choice
	case ${choice} in
		1) SUF="0"; command ;;
		2) SUF="1"; command ;;
		3) SUF="2"; command ;;
		4) SUF="3"; command ;;
		5) SUF="4"; command ;;
		6) SUF="5"; command ;;
		7) SUF="6"; command ;;
		8) SUF="7"; command ;;
		9) SUF="8"; command ;;
		0) ;;
		*) invalid; vproev ;;
	esac
}

# 2) PHOTO SETTINGS

photoMenu() {
	clear
	echo -e "\n Photo Settings\n"
	echo " 1. Resolution"
	echo " 2. Spot Meter"
	echo " 3. Protune"
	echo
	echo -e " 0. Return\n"
}

photo() {
	local choice
	while true; do
		photoMenu
		read -p " > " choice
		case ${choice} in
			1) pres ;;
			2) pspo ;;
			3) ppro ;;
			0) break ;;
			*) invalid ;;
		esac
	done
}

# 2.1) RESOLUTION

presMenu() {
	clear
	echo -e "\n Resolution\n"
	echo " 1. 12MP wide"
	echo " 2.  7MP wide"
	echo " 3.  7MP medium"
	echo " 4.  5MP medium"
	echo
	echo -e " 0. Return\n"
}

pres() {
	PRE="setting/17/"
	local choice
	presMenu
	read -p " > " choice
	case ${choice} in
		1) SUF="0"; command ;;
		2) SUF="1"; command ;;
		3) SUF="2"; command ;;
		4) SUF="3"; command ;;
		0) ;;
		*) invalid; pres ;;
	esac
}

# 2.2) SPOT METER

pspoMenu() {
	clear
	echo -e "\n Spot Meter\n"
	echo " 1. On"
	echo " 2. Off"
	echo
	echo -e " 0. Return\n"
}

pspo() {
	PRE="setting/20/"
	local choice
	pspoMenu
	read -p " > " choice
	case ${choice} in
		1) SUF="1"; command ;;
		2) SUF="0"; command ;;
		0) ;;
		*) invalid; pspo ;;
	esac
}

# 2.3) PROTUNE

pproMenu() {
	clear
	echo -e "\n Protune\n"
	echo " 1. On"
	echo " 2. Off"
	echo " 3. White Balance"
	echo " 4. Color"
	echo " 5. ISO Min"
	echo " 6. ISO Max"
	echo " 7. Sharpness"
	echo " 8. EV Compensation"
	echo " 9. Reset Protune"
	echo
	echo -e " 0. Return\n"
}

ppro() {
	local choice
	while true; do	
		PRE="setting/21/"
		pproMenu
		read -p " > " choice
		case ${choice} in
			1) SUF="1"; command ;;
			2) SUF="0"; command ;;
			3) pprowb ;;
			4) pproco ;;
			5) pproii ;;
			6) pproia ;;
			7) pprosh ;;
			8) pproev ;;
			9) PRE=""; SUF="command/photo/protune/reset"; command ;;
			0) break ;;
			*) invalid ;;
		esac
	done	
}

# 2.3.1) WHITE BALANCE

pprowbMenu() {
	clear
	echo -e "\n White Balance\n"
	echo " 1. Auto"
	echo " 2. 3000K"
	echo " 3. 4000K"
	echo " 4. 4800K"
	echo " 5. 5500K"
	echo " 6. 6000K"
	echo " 7. 6500K"
	echo " 8. Native"
	echo
	echo -e " 0. Return\n"
}

pprowb() {
	PRE="setting/22/"
	local choice
	pprowbMenu
	read -p " > " choice
	case ${choice} in
		1) SUF="0"; command ;;
		2) SUF="1"; command ;;
		3) SUF="5"; command ;;
		4) SUF="6"; command ;;
		5) SUF="2"; command ;;
		6) SUF="7"; command ;;
		7) SUF="3"; command ;;
		8) SUF="4"; command ;;
		0) ;;
		*) invalid; pprowb ;;
	esac
}

# 2.3.2) COLOR

pprocoMenu() {
	clear
	echo -e "\n Color\n"
	echo " 1. GoPro Color"
	echo " 2. Flat"
	echo
	echo -e " 0. Return\n"
}

pproco() {
	PRE="setting/23/"
	local choice
	pprocoMenu
	read -p " > " choice
	case ${choice} in
		1) SUF="0"; command ;;
		2) SUF="1"; command ;;
		0) ;;
		*) invalid; pproco ;;
	esac
}

# 2.3.3) ISO MIN

pproiiMenu() {
	clear
	echo -e "\n ISO Min\n"
	echo " 1. 800"
	echo " 2. 400"
	echo " 3. 200"
	echo " 4. 100"
	echo
	echo -e " 0. Return\n"
}

pproii() {
	PRE="setting/75/"
	local choice
	pproiiMenu
	read -p " > " choice
	case ${choice} in
		1) SUF="0"; command ;;
		2) SUF="1"; command ;;
		3) SUF="2"; command ;;
		4) SUF="3"; command ;;
		0) ;;
		*) invalid; pproii ;;
	esac
}

# 2.3.4) ISO MAX

pproiaMenu() {
	clear
	echo -e "\n ISO Max\n"
	echo " 1. 800"
	echo " 2. 400"
	echo " 3. 200"
	echo " 4. 100"
	echo
	echo -e " 0. Return\n"
}

pproia() {
	PRE="setting/24/"
	local choice
	pproiaMenu
	read -p " > " choice
	case ${choice} in
		1) SUF="0"; command ;;
		2) SUF="1"; command ;;
		3) SUF="2"; command ;;
		4) SUF="3"; command ;;
		0) ;;
		*) invalid; pproia ;;
	esac
}

# 2.3.5) SHARPNESS

pproshMenu() {
	clear
	echo -e "\n Sharpness\n"
	echo " 1. High"
	echo " 2. Medium"
	echo " 3. Low"
	echo
	echo -e " 0. Return\n"
}

pprosh() {
	PRE="setting/25/"
	local choice
	pproshMenu
	read -p " > " choice
	case ${choice} in
		1) SUF="0"; command ;;
		2) SUF="1"; command ;;
		3) SUF="2"; command ;;
		0) ;;
		*) invalid; pprosh ;;
	esac
}

# 2.3.6) EV COMPENSATION

pproevMenu() {
	clear
	echo -e "\n EV Compensation\n"
	echo " 1. +2.0"
	echo " 2. +1.5"
	echo " 3. +1.0"
	echo " 4. +0.5"
	echo " 5.  0.0"
	echo " 6. -0.5"
	echo " 7. -1.0"
	echo " 8. -1.5"
	echo " 9. -2.0"
	echo
	echo -e " 0. Return\n"
}

pproev() {
	PRE="setting/26/"
	local choice
	pproevMenu
	read -p " > " choice
	case ${choice} in
		1) SUF="0"; command ;;
		2) SUF="1"; command ;;
		3) SUF="2"; command ;;
		4) SUF="3"; command ;;
		5) SUF="4"; command ;;
		6) SUF="5"; command ;;
		7) SUF="6"; command ;;
		8) SUF="7"; command ;;
		9) SUF="8"; command ;;
		0) ;;
		*) invalid; pproev ;;
	esac
}

# 3) MULTI-SHOT SETTINGS

multiMenu() {
	clear
	echo -e "\n Multi-Shot Settings\n"
	echo " 1. Rate"
	echo " 2. Resolution"
	echo " 3. Spot Meter"
	echo " 4. Protune"
	echo
	echo -e " 0. Return\n"
}

multi() {
	local choice
	while true; do
		multiMenu
		read -p " > " choice
		case ${choice} in
			1) mrat ;;
			2) mres ;;
			3) mspo ;;
			4) mpro ;;
			0) break ;;
			*) invalid ;;
		esac
	done
}

# 3.1) RATE

mratMenu() {
	clear
	echo -e "\n Rate\n"
	echo " 1.  3/1"
	echo " 2.  5/1"
	echo " 3. 10/1"
	echo " 4. 10/2"
	echo " 5. 10/3"
	echo " 6. 30/1"
	echo " 7. 30/2"
	echo " 8. 30/3"
	echo " 9. 30/6"
	echo
	echo -e " 0. Return\n"
}

mrat() {
	PRE="setting/29/"
	local choice
	mratMenu
	read -p " > " choice
	case ${choice} in
		1) SUF="0"; command ;;
		2) SUF="1"; command ;;
		3) SUF="2"; command ;;
		4) SUF="3"; command ;;
		5) SUF="4"; command ;;
		6) SUF="5"; command ;;
		7) SUF="6"; command ;;
		8) SUF="7"; command ;;
		9) SUF="8"; command ;;
		0) ;;
		*) invalid; mrat ;;
	esac
}

# 3.2) RESOLUTION

mresMenu() {
	clear
	echo -e "\n Resolution\n"
	echo " 1. 12MP wide"
	echo " 2.  7MP wide"
	echo " 3.  7MP medium"
	echo " 4.  5MP medium"
	echo
	echo -e " 0. Return\n"
}

mres() {
	PRE="setting/28/"
	local choice
	mresMenu
	read -p " > " choice
	case ${choice} in
		1) SUF="0"; command ;;
		2) SUF="1"; command ;;
		3) SUF="2"; command ;;
		4) SUF="3"; command ;;
		0) ;;
		*) invalid; mres ;;
	esac
}

# 3.3) SPOT METER

mspoMenu() {
	clear
	echo -e "\n Spot Meter\n"
	echo " 1. On"
	echo " 2. Off"
	echo
	echo -e " 0. Return\n"
}

mspo() {
	PRE="setting/33/"
	local choice
	mspoMenu
	read -p " > " choice
	case ${choice} in
		1) SUF="1"; command ;;
		2) SUF="0"; command ;;
		0) ;;
		*) invalid; mspo ;;
	esac
}

# 3.4) PROTUNE

mproMenu() {
	clear
	echo -e "\n Protune\n"
	echo " 1. On"
	echo " 2. Off"
	echo " 3. White Balance"
	echo " 4. Color"
	echo " 5. ISO Min"
	echo " 6. ISO Max"
	echo " 7. Sharpness"
	echo " 8. EV Compensation"
	echo " 9. Reset Protune"
	echo
	echo -e " 0. Return\n"
}

mpro() {
	local choice
	while true; do	
		PRE="setting/34/"
		mproMenu
		read -p " > " choice
		case ${choice} in
			1) SUF="1"; command ;;
			2) SUF="0"; command ;;
			3) mprowb ;;
			4) mproco ;;
			5) mproii ;;
			6) mproia ;;
			7) mprosh ;;
			8) mproev ;;
			9) PRE=""; SUF="command/multi_shot/protune/reset"; command ;;
			0) break ;;
			*) invalid ;;
		esac
	done	
}

# 3.4.1) WHITE BALANCE

mprowbMenu() {
	clear
	echo -e "\n White Balance\n"
	echo " 1. Auto"
	echo " 2. 3000K"
	echo " 3. 4000K"
	echo " 4. 4800K"
	echo " 5. 5500K"
	echo " 6. 6000K"
	echo " 7. 6500K"
	echo " 8. Native"
	echo
	echo -e " 0. Return\n"
}

mprowb() {
	PRE="setting/35/"
	local choice
	mprowbMenu
	read -p " > " choice
	case ${choice} in
		1) SUF="0"; command ;;
		2) SUF="1"; command ;;
		3) SUF="5"; command ;;
		4) SUF="6"; command ;;
		5) SUF="2"; command ;;
		6) SUF="7"; command ;;
		7) SUF="3"; command ;;
		8) SUF="4"; command ;;
		0) ;;
		*) invalid; mprowb ;;
	esac
}

# 3.4.2) COLOR

mprocoMenu() {
	clear
	echo -e "\n Color\n"
	echo " 1. GoPro Color"
	echo " 2. Flat"
	echo
	echo -e " 0. Return\n"
}

mproco() {
	PRE="setting/36/"
	local choice
	mprocoMenu
	read -p " > " choice
	case ${choice} in
		1) SUF="0"; command ;;
		2) SUF="1"; command ;;
		0) ;;
		*) invalid; mproco ;;
	esac
}

# 3.4.3) ISO MIN

mproiiMenu() {
	clear
	echo -e "\n ISO Min\n"
	echo " 1. 800"
	echo " 2. 400"
	echo " 3. 200"
	echo " 4. 100"
	echo
	echo -e " 0. Return\n"
}

mproii() {
	PRE="setting/76/"
	local choice
	mproiiMenu
	read -p " > " choice
	case ${choice} in
		1) SUF="0"; command ;;
		2) SUF="1"; command ;;
		3) SUF="2"; command ;;
		4) SUF="3"; command ;;
		0) ;;
		*) invalid; mproii ;;
	esac
}

# 3.4.4) ISO MAX

mproiaMenu() {
	clear
	echo -e "\n ISO Max\n"
	echo " 1. 800"
	echo " 2. 400"
	echo " 3. 200"
	echo " 4. 100"
	echo
	echo -e " 0. Return\n"
}

mproia() {
	PRE="setting/37/"
	local choice
	mproiaMenu
	read -p " > " choice
	case ${choice} in
		1) SUF="0"; command ;;
		2) SUF="1"; command ;;
		3) SUF="2"; command ;;
		4) SUF="3"; command ;;
		0) ;;
		*) invalid; mproia ;;
	esac
}

# 3.4.5) SHARPNESS

mproshMenu() {
	clear
	echo -e "\n Sharpness\n"
	echo " 1. High"
	echo " 2. Medium"
	echo " 3. Low"
	echo
	echo -e " 0. Return\n"
}

mprosh() {
	PRE="setting/38/"
	local choice
	mproshMenu
	read -p " > " choice
	case ${choice} in
		1) SUF="0"; command ;;
		2) SUF="1"; command ;;
		3) SUF="2"; command ;;
		0) ;;
		*) invalid; mprosh ;;
	esac
}

# 3.4.6) EV COMPENSATION

mproevMenu() {
	clear
	echo -e "\n EV Compensation\n"
	echo " 1. +2.0"
	echo " 2. +1.5"
	echo " 3. +1.0"
	echo " 4. +0.5"
	echo " 5.  0.0"
	echo " 6. -0.5"
	echo " 7. -1.0"
	echo " 8. -1.5"
	echo " 9. -2.0"
	echo
	echo -e " 0. Return\n"
}

mproev() {
	PRE="setting/39/"
	local choice
	mproevMenu
	read -p " > " choice
	case ${choice} in
		1) SUF="0"; command ;;
		2) SUF="1"; command ;;
		3) SUF="2"; command ;;
		4) SUF="3"; command ;;
		5) SUF="4"; command ;;
		6) SUF="5"; command ;;
		7) SUF="6"; command ;;
		8) SUF="7"; command ;;
		9) SUF="8"; command ;;
		0) ;;
		*) invalid; mproev ;;
	esac
}

# 4) SETUP

setupMenu() {
	clear
	echo -e "\n Setup\n"
	echo " 1. Orientation"
	echo " 2. Default Mode"
	echo " 3. Quick Capture"
	echo " 4. LED"
	echo " 5. Beeps"
	echo " 6. Video Region"
	echo " 7. On Screen Display"
	echo " 8. Auto-Off"
	echo " 9. Set Date and Time"
	echo
	echo -e " 0. Return\n"
}

setup() {
	local choice
	while true; do
		setupMenu
		read -p " > " choice
		case ${choice} in
			1) orient ;;
			2) defmod ;;
			3) quicap ;;
			4) led ;;
			5) beeps ;;
			6) vidreg ;;
			7) osd ;;
			8) autoff ;;
			9) setdat ;;
			0) break ;;
			*) invalid ;;
		esac
	done
}

# 4.1) ORIENTATION

orientMenu() {
	clear
	echo -e "\n Orientation\n"
	echo " 1. Up"
	echo " 2. Down"
	echo " 3. Auto"
	echo
	echo -e " 0. Return\n"
}

orient() {
	PRE="setting/52/"
	local choice
	orientMenu
	read -p " > " choice
	case ${choice} in
		1) SUF="1"; command ;;
		2) SUF="2"; command ;;
		3) SUF="0"; command ;;
		0) ;;
		*) invalid; orient ;;
	esac
}

# 4.2) DEFAULT MODE

defmodMenu() {
	clear
	echo -e "\n Default Mode\n"
	echo " 1. Video"
	echo " 2. Photo"
	echo " 3. Multi-Shot"
	echo
	echo -e " 0. Return\n"
}

defmod() {
	PRE="setting/53/"
	local choice
	defmodMenu
	read -p " > " choice
	case ${choice} in
		1) SUF="0"; command ;;
		2) SUF="1"; command ;;
		3) SUF="2"; command ;;
		0) ;;
		*) invalid; defmod ;;
	esac
}

# 4.3) QUICK CAPTURE

quicapMenu() {
	clear
	echo -e "\n Quick Capture\n"
	echo " 1. On"
	echo " 2. Off"
	echo
	echo -e " 0. Return\n"
}

quicap() {
	PRE="setting/54/"
	local choice
	quicapMenu
	read -p " > " choice
	case ${choice} in
		1) SUF="1"; command ;;
		2) SUF="0"; command ;;
		0) ;;
		*) invalid; quicap ;;
	esac
}

# 4.4) LED

ledMenu() {
	clear
	echo -e "\n LED Blink\n"
	echo " 1. 2"
	echo " 2. 4"
	echo " 3. Off"
	echo
	echo -e " 0. Return\n"
}

led() {
	PRE="setting/55/"
	local choice
	ledMenu
	read -p " > " choice
	case ${choice} in
		1) SUF="1"; command ;;
		2) SUF="2"; command ;;
		3) SUF="0"; command ;;
		0) ;;
		*) invalid; led ;;
	esac
}

# 4.5) BEEPS

beepsMenu() {
	clear
	echo -e "\n Beeps\n"
	echo " 1. Off"
	echo " 2. 70%"
	echo " 3. 100%"
	echo
	echo -e " 0. Return\n"
}

beeps() {
	PRE="setting/56/"
	local choice
	beepsMenu
	read -p " > " choice
	case ${choice} in
		1) SUF="2"; command ;;
		2) SUF="1"; command ;;
		3) SUF="0"; command ;;
		0) ;;
		*) invalid; beeps ;;
	esac
}

# 4.6) VIDEO REGION

vidregMenu() {
	clear
	echo -e "\n Video Region\n"
	echo " 1. NTSC"
	echo " 2. PAL"
	echo
	echo -e " 0. Return\n"
}

vidreg() {
	PRE="setting/57/"
	local choice
	vidregMenu
	read -p " > " choice
	case ${choice} in
		1) SUF="0"; command ;;
		2) SUF="1"; command ;;
		0) ;;
		*) invalid; vidreg ;;
	esac
}

# 4.7) OSD

osdMenu() {
	clear
	echo -e "\n OSD\n"
	echo " 1. On"
	echo " 2. Off"
	echo
	echo -e " 0. Return\n"
}

osd() {
	PRE="setting/58/"
	local choice
	osdMenu
	read -p " > " choice
	case ${choice} in
		1) SUF="1"; command ;;
		2) SUF="0"; command ;;
		0) ;;
		*) invalid; osd ;;
	esac
}

# 4.8) AUTO-OFF

autoffMenu() {
	clear
	echo -e "\n Auto-Off\n"
	echo " 1. Never"
	echo " 2. 1 min"
	echo " 3. 2 min"
	echo " 4. 3 min"
	echo " 5. 5 min"
	echo
	echo -e " 0. Return\n"
}

autoff() {
	PRE="setting/59/"
	local choice
	autoffMenu
	read -p " > " choice
	case ${choice} in
		1) SUF="0"; command ;;
		2) SUF="1"; command ;;
		3) SUF="2"; command ;;
		4) SUF="3"; command ;;
		5) SUF="4"; command ;;
		0) ;;
		*) invalid; autoff ;;
	esac
}

# 4.9) SET DATE AND TIME

setdat() {
	echo
	echo -n " Not implemented yet. "
	pause
}

# 5) DELETE

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
			1) deletelast ;;
			2) deleteall ;;
			0) break ;;
			*) invalid ;;
		esac
	done
}

# 5.1) DELETE LAST

deletelast() {
	read -p " > Execute? [yn] " choice
	case ${choice} in
		y) PRE="command/storage/delete/"; SUF="last"; command ;;
	esac
}

# 5.2) DELETE ALL

deleteall() {
	read -p " > Execute? [yn] " choice
	case ${choice} in
		y) PRE="command/storage/delete/"; SUF="all"; command ;;
	esac
}

# 6) CAMERA INFO

infoMenu() {
	clear
	echo -e "\n Camera Info\n"
	echo " 1. Set SSID and password"
	echo " 2. Locate"
	echo " 3. Media List"
	echo " 4. Command List"
	echo
	echo -e " 0. Return\n"
}

info() {
	local choice
	while true; do
		infoMenu
		read -p " > " choice
		case ${choice} in
			1) ssidpw ;;
			2) locate ;;
			3) medialist ;;
			4) gpcontrol ;;
			0) break ;;
			*) invalid ;;
		esac
	done
}

# 6.1) SSID/PASSWORD

ssidpw() {
	local ssid
	local pass
	echo -ne "\n"
	read -p " SSID: " ssid
	read -p " Password: " pass
	res=$(curl -s -m 2 "http://10.5.5.9/gp/gpControl/command/wireless/ap/ssid?ssid=${ssid}&pw=${pass}")
	if [[ ${res} == "{}"* ]]
	then
		echo -ne "\n Operation successful. Disconnecting.\n" && sleep 2
		exit 0
	else
		echo -ne "\n Operation failed. " && sleep 2
	fi			
}

# 6.2) LOCATE

locateMenu() {
	clear
	echo -e "\n Locate\n"
	echo " 1. On"
	echo " 2. Off"
	echo
	echo -e " 0. Return\n"
}

locate() {
	PRE="command/system/locate?p="
	local choice
	locateMenu
	read -p " > " choice
	case ${choice} in
		1) SUF="1"; command ;;
		2) SUF="0"; command ;;
		0) ;;
		*) invalid; locate ;;
	esac
}

# 6.3) MEDIALIST

medialist() {
	echo
	echo -ne $(curl -s -m 2 "http://10.5.5.9:8080/gp/gpMediaList") | \
		sed -e "s/\[{/\[{\n/g" | \
		sed -e "s/\,{/,{\n/g" | \
		sed -e "s/\"d\"/  \"d\"/g" | \
		sed -e "s/\"n\"/    \"n\"/g"
	read -rsp $'' -n1 key
}

# 6.4) GPCONTROL

gpcontrol() {
	echo
	echo -ne $(curl -s -m 2 "http://10.5.5.9:8080/gp/gpControl") | \
		sed -e "s/\[{/\[{\n/g" | \
		sed -e "s/\,{/,{\n/g" | \
		sed -e "s/\"d\"/  \"d\"/g" | \
		sed -e "s/\"n\"/    \"n\"/g"
	read -rsp $'' -n1 key
}

# 7) PAIR

pair() {
	local pin
	echo -ne "\n"
	read -p " Enter PIN: " pin
	res=$(curl -k -s -m 2 "https://10.5.5.9/gpPair?c=start&pin=${pin}&mode=0")
	if [[ ${res} != *"password"* ]]
	then
		echo -ne "\n ${RED}Pairing failed!${STD} " && sleep 2
	else
		res=$(curl -k -s -m 2 "https://10.5.5.9/gpPair?c=finish&pin=${pin}&mode=0")
		if [[ ${res} != "{ }"* ]]
		then
			echo -ne "\n Pairing successful. "  && sleep 2
		else
			echo -ne "\n Pairing done. " && sleep 2
		fi
	fi
}

# 8) CONTROL

controlMenu() {
	clear
	echo -e "\n Control\n"
	echo " 1. Recording"
	echo " 2. Tag moment"
	echo " 3. Power"
	echo
	echo -e " 0. Return\n"
}

control() {
	local choice
	while true; do
		controlMenu
		read -p " > " choice
		case ${choice} in
			1) recording ;;
			2) tag ;;
			3) power ;;
			0) break ;;
			*) invalid ;;
		esac
	done
}

# 8.1) RECORDING

recordingMenu() {
	clear
	echo -e "\n Recording\n"
	echo " 1. Start"
	echo " 2. Stop"
	echo
	echo -e " 0. Return\n"
}

recording() {
	PRE="command/shutter?p="
	local choice
	recordingMenu
	read -p " > " choice
	case ${choice} in
		1) SUF="1"; command ;;
		2) SUF="0"; command ;;
		0) ;;
		*) invalid; recording ;;
	esac
}

# 8.2) TAG MOMENT

tag() {
	PRE="command/storage/"
	SUF="tag_moment"
	command
	pause
}

# 8.3) POWER

powerMenu() {
	clear
	echo -e "\n Power\n"
	echo " 1. On"
	echo " 2. Off"
	echo
	echo -e " 0. Return\n"
}

power() {
	PRE="command/system/"
	local choice
	powerMenu
	read -p " > " choice
	#MAC=$(arp -an | grep 10.5.5.9 | cut -d " " -f 4)
	case ${choice} in
		1) echo -e "\xff\xff\xff\xff\xff\xff\x00\x17\x31\x3f\xd3\xa9\x00\x17\x31\x3f\xd3\xa9\x00\x17\x31\x3f\xd3\xa9\x00\x17\x31\x3f\xd3\xa9\x00\x17\x31\x3f\xd3\xa9\x00\x17\x31\x3f\xd3\xa9\x00\x17\x31\x3f\xd3\xa9\x00\x17\x31\x3f\xd3\xa9\x00\x17\x31\x3f\xd3\xa9\x00\x17\x31\x3f\xd3\xa9\x00\x17\x31\x3f\xd3\xa9\x00\x17\x31\x3f\xd3\xa9\x00\x17\x31\x3f\xd3\xa9\x00\x17\x31\x3f\xd3\xa9\x00\x17\x31\x3f\xd3\xa9\x00\x17\x31\x3f\xd3\xa9" > /dev/udp/10.5.5.9/4000 ;; # wol, its magic :-)
		2) SUF="sleep"; command ;;
		0) ;;
		*) invalid; power ;;
	esac
}

# 9) PREVIEW

preview() {
	PRE="execute?p1=gpStream&c1="
	name=$(echo "$0" | awk -F'/' '{print $NF}')
	bash $name preview &
	SUF="restart" ; command
	ip=$(ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1  -d'/')
	echo -ne "\n"	
	echo -ne "\n make sure to"
	echo -ne "\n - allow incoming traffic (firewall)"
	echo -ne "\n - leave settings mode (camera)\n"
	echo -ne "\n stream opened at \"udp://$ip:8554\" (ffmpeg) "
	read -rsp $'' -n1 key
	echo
	SUF="stop" ; command
	kill -9 $(ps aux | grep "$name preview" | grep -v root | awk "{print $2}") &> /dev/null
	(( $? == 0)) && echo -ne "\n stream closed ";
	pause
}

# MAIN

mainMenu() {
	clear
	echo -e "\n GoPro HERO4 Silver Edition\n"
	echo " 1. Video Settings"
	echo " 2. Photo Settings"
	echo " 3. Multi-Shot Settings"
	echo " 4. Setup"
	echo " 5. Delete"
	echo " 6. Camera Info"
	echo " 7. Pair/Connect"
	echo " 8. Control"
	echo " 9. Preview"
	echo
	echo -e " 0. Exit\n"
}

main() {
	local choice
	while true; do
		mainMenu
		read -p " > " choice
		case ${choice} in
			1) video ;;
			2) photo ;;
			3) multi ;;
			4) setup ;;
			5) delete ;;
			6) info ;;
			7) pair ;;
            8) control ;;
            9) preview ;;
			0) exit 0 ;;
			*) invalid ;;
		esac
	done
}

command() {
	echo -ne "\n ${PRE}${SUF} : $(curl -s -m 2 "http://10.5.5.9/gp/gpControl/${PRE}${SUF}")"
	pause
}

pause() {
	sleep 1.5
}

invalid() {
	echo -ne "\n ${RED}invalid${STD} " && sleep 1
}

STAT=$(curl -s -m 3 "http://10.5.5.9/gp/gpControl/status")
if [[ -z ${STAT} ]]; then
	echo -e "\n GoPro not connected!\n"
	echo -e " If GoPro is not paired to this device\n try again after choosing \"Pair/Connect > GoPro App\" and\n connecting to \"GPxxxxxxxx\" (password \"goprohero\").\n"
	exit 1
fi

if [[ $# == 0 ]]; then

	trap '' SIGINT SIGQUIT SIGTSTP
	main

else # PREVIEW

	while true; do

	  # GoPro 4 (keep alive)
	  #sendip -p ipv4 -p udp -us 8554 -is 10.5.5.101 -ud 8554 -d "_GPHD_:1:0:2:0" 10.5.5.9
	  echo -ne "_GPHD_:1:0:2:0" > /dev/udp/10.5.5.9/8554
	  sleep 2.5

	done

fi

