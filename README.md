# hestia-build-drone

Build Hestia packages with drone / docker

# Setup

## Install "Drone master server" 

- Install Docker on a server (https://docs.docker.com/engine/install/ubuntu/)
- Install Drone.io (Drone "server" currently does not support ARM64) (https://docs.drone.io/server/provider/github/) 

```
    docker run \
    --volume=/var/lib/drone:/data \
    --env=DRONE_GITHUB_CLIENT_ID=github-app-key \
    --env=DRONE_GITHUB_CLIENT_SECRET=github-secret \
    --env=DRONE_RPC_SECRET=drone-secret \
    --env=DRONE_SERVER_HOST=drone.xxxx.xyz \
    --env=DRONE_SERVER_PROTO=https \
    --env=DRONE_TLS_AUTOCERT=true \
    --env=DRONE_USER_CREATE=username:username,admin:true \
    --env=DRONE_USER_FILTER=org \
    --publish=80:80  --publish=443:443  --restart=always  --detach=true  --name=drone   drone/drone:2
```

- Install docker runners One AMD64 server capable to build packages for amd64 packages (Can be the same as the drone server)
```
    docker run --detach \
      --volume=/var/run/docker.sock:/var/run/docker.sock \
      --env=DRONE_RPC_PROTO=https \
      --env=DRONE_RPC_HOST=drone.xxxx.xyz
      --env=DRONE_RPC_SECRET=super-duper-secret \
      --env=DRONE_RUNNER_CAPACITY=2 \
      --env=DRONE_RUNNER_NAME=my-first-runner \
      --publish=3000:3000 \
      --restart=always \
      --name=runner \
      drone/drone-runner-docker:1
```
-   One ARM64 server capable to build packages for arm64 packages 
```
    docker run --detach \
      --volume=/var/run/docker.sock:/var/run/docker.sock \
      --env=DRONE_RPC_PROTO=https \
      --env=DRONE_RPC_HOST=drone.xxxx.xyz \
      --env=DRONE_RPC_SECRET=super-duper-secret \
      --env=DRONE_RUNNER_CAPACITY=1 --env=DRONE_RUNNER_NAME=amd64 \
      --publish=3000:3000  \
      --restart=always \
      --name=runner  \
      --platform=arm64 \
      drone/drone-runner-docker:linux-arm64
 ```

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