# hestia-build-drone

Build Hestia packages with drone / docker

# Setup

## Install "Drone server" 

- Install Docker on a server
- Follow the instruction from drone.io website https://docs.drone.io/server/provider/github/ no special requirements are need!
- Setup 2 Docker drone docker runners:
    -   One AMD64 server capable to build packages for amd64 packages (Can be the same as the drone server)
    -   One ARM64 server capable to build packages for arm64 packages 

## Prepare settings

- Login into your drone server
- Select hestia-build-drone
- Click "Activate repository"
- General: Disable Pull Requests and Disable forks and enable Protected 
- Save changes
- Go to Secrets: 
    - ssh_key = rsa key to login into the target server where the packages finally end
    - target_server = hostname of target server


## Build the packages
- Update clone_hestiacp.sh and update the target branch then push the commit