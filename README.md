# Motorola MDK Docker Container #

This tool will build the Motorola Moto Mods Developmemt Kit environment to a docker container and attach to the container using VSCode Container

Optionally, you can launch this in WSL without docker (way better performance than using docker on Windows), and run the `scripts/setup-wsl.sh` file to install required dependencies.
Works best with Ubuntu 16.04. May require additional tinkering for newer versions.
https://www.microsoft.com/en-us/p/ubuntu-1604-lts/9pjn388hp8c9?rtc=1&activetab=pivot:overviewtab


https://developer.motorola.com/documentation/developer-tools-overview

Mirrors:

Overview: https://web.archive.org/web/20161019022207/http://developer.motorola.com/build/tools

Setup Environment: https://web.archive.org/web/20161026022354/http://developer.motorola.com/build/tools/setup-environment

Build from source: https://web.archive.org/web/20161031223255/http://developer.motorola.com/build/tools/build-from-source

Flashing Firmware: https://web.archive.org/web/20161031223553/http://developer.motorola.com/build/tools/flashing-firmware

Debug And Log: https://web.archive.org/web/20161102205125/http://developer.motorola.com/build/tools/debug-and-log

## Requirements ##

- Docker or WSL
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

### Setup (scripts/setup-wsl.sh) ###

Initial setup of all tools required to build a file. This does all the steps required on http://developer.motorola.com/build/tools/setup-environment, and builds the menuconfig

GDB and openocd can be removed from the script if not needed, or if they fail to build.

### Clean (scripts/nuttxInit.sh) ###

runs distclean on Nuttx

### Configure (scripts/configure.sh) ###

Configures a specific target (hdk/muc/...) Asks for input when run

### Make ###

Runs Setup->Clean->Configure->make@/workspace/nuttx/nuttx

This is the default build task, so it can be used with a shortcut if setup (CTRL+SHIFT+B on Windows)
