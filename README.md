# Outline deploy scripts for Ubuntu #

A script to quickly set up Outline VPN on Ubuntu.

It generates VPN config, starts the VPN and adds it to autorun

Tested on Ubuntu 22.04

## Differences from the Official Script ##

The official install script is available [here](https://raw.githubusercontent.com/Jigsaw-Code/outline-server/master/src/server_manager/install_scripts/install_server.sh)

The differences:
- no Docker — less memory, less complexity with routing
- no nodejs API for dynamic key addition — less memory, no need to use GUI application to setup server. The script pregenerates 100 keys for sharing
- no Prometheus — less memory
- no autoupdates — less surprises

## Usage ##
    
1. `git clone https://github.com/alexbers/outline_deploy.git; cd outline_deploy`
2. `./outline_deploy.sh`

If all ok, the links will be in links.txt


![Demo](https://alexbers.com/outline.png)