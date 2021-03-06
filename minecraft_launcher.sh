#!/bin/bash

# VARIABLES
server=$1
base_dir="/var/games"
work_dir="${base_dir}"/"${server}"

# MAKE THE DIRECTORY AND FILES
mkdir -p "${work_dir}"
touch "${work_dir}"/whitelist.json
touch "${work_dir}"/server.properties
touch "${work_dir}"/permissions.json

# START THE CONTAINER
docker run -d -h ${server} --name=${server}\
 -v "${work_dir}/whitelist.json:/opt/minecraft/whitelist.json:z"\
 -v "${work_dir}/server.properties:/opt/minecraft/server.properties:z"\
 -v "${work_dir}/permissions.json:/opt/minecraft/permissions.json:z"\
 -v "${work_dir}/worlds:/opt/minecraft/worlds:z"\
 --network=host\
 imetzach/minecraft-bedrockserver
