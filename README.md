# Motorola MDK Docker Container #

This tool will build the Motorola Moto Mods Developmemt Kit environment to a docker container and attach to the container using VSCode Container
https://developer.motorola.com/documentation/developer-tools-overview

Mirrors:

Overview: https://web.archive.org/web/20161019022207/http://developer.motorola.com/build/tools
Setup Environment: https://web.archive.org/web/20161026022354/http://developer.motorola.com/build/tools/setup-environment
Build from source: https://web.archive.org/web/20161031223255/http://developer.motorola.com/build/tools/build-from-source
Flashing Firmware: https://web.archive.org/web/20161031223553/http://developer.motorola.com/build/tools/flashing-firmware
Debug And Log: https://web.archive.org/web/20161102205125/http://developer.motorola.com/build/tools/debug-and-log

## Requirements ##

- Docker
- VSCode
- VSCode remote containers - https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers

Note: Please view the requirements of remote containers. Docker Toolbox is not supported

## How to use ##
1. Add the repos from https://developer.motorola.com/documentation/build-source to a folder named "workspace"
1. Open the folder in VSCode
2. Optionally prebuild the dockerfile (VSCode plugin exists for this as well, but can be done via command line)
3. At the bottom left of VSCode, click the icon for actions, and select "Remote-Containers: Reopen in container"
4. Once built, it should be ready to be used.

Environment variables for BUILD_TOP and adding bootrom-tools and manifesto to PATH has already been done.

## Helper Scripts ##

Helper scripts show up in the Terminal Tasks for vscode.
Scripts are tied to tasks in ./vscode/tasks.json.

### Setup (scripts/setup.sh) ###

Initial setup of /workspace/nuttx/misc/tools/kconfig-frontends for setting up the build environment

### Clean (scripts/nuttxInit.sh) ###

runs distclean on Nuttx

### Configure (scripts/configure.sh) ###

Configures a specific target (hdk/muc/...) Asks for input when run

### Make ###

Runs Setup->Clean->Configure->make@/workspace/nuttx/nuttx

This is the default build task, so it can be used with a shortcut if setup (CTRL+SHIFT+B on Windows)
