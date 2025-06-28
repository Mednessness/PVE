#!/usr/bin/env bash
source <(curl -fsSL https://raw.githubusercontent.com/Mednessness/PVE/refs/heads/main/build1.func)
# Copyright (c) 2021-2024 tteck
# Author: tteck (tteckster)
# License: MIT
# https://github.com/tteck/Proxmox/raw/main/LICENSE
# bash -c "$(wget -qLO - https://github.com/tteck/Proxmox/raw/main/ct/cloudflared.sh)"

function header_info {
clear
cat <<"EOF"
   ________                ________                    __
  / ____/ /___  __  ______/ / __/ /___ _________  ____/ /
 / /   / / __ \/ / / / __  / /_/ / __ `/ ___/ _ \/ __  / 
/ /___/ / /_/ / /_/ / /_/ / __/ / /_/ / /  /  __/ /_/ /  
\____/_/\____/\__,_/\__,_/_/ /_/\__,_/_/   \___/\__,_/   
                                                         
EOF
}
header_info
echo -e "Loading..."
APP="Cloudflared"
var_disk="2"
var_cpu="1"
var_ram="512"
var_os="debian"
var_version="12"
variables
color
catch_errors

function default_settings() {
  CT_TYPE="1"
  PW="homeveer"
  CT_ID="202"
  HN=$NSAPP
  DISK_SIZE="$var_disk"
  CORE_COUNT="$var_cpu"
  RAM_SIZE="$var_ram"
  BRG="vmbr0"
  NET="192.168.14.202/24"
  GATE="192.168.14.1"
  APT_CACHER=""
  APT_CACHER_IP=""
  DISABLEIP6="no"
  MTU=""
  SD=""
  NS=""
  MAC="00:00:00:00:02:02"
  VLAN=""
  SSH="yes"
  VERB="yes"
  echo_default
}

function update_script() {
header_info
if [[ ! -d /var ]]; then msg_error "No ${APP} Installation Found!"; exit; fi
msg_info "Updating $APP LXC"
apt-get update &>/dev/null
apt-get -y upgrade &>/dev/null
msg_ok "Updated $APP LXC"
exit
}

start
build_container
description

msg_ok "Completed Successfully!\n"
