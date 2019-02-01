if [[ "$OSTYPE" == "darwin"* ]]; then
    xhost + $(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
    docker run \
        -it \
        --env DISPLAY=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}'):0 \
        --name nostale \
        --privileged \
        --rm \
        --volume /tmp/.X11-unix/:/tmp/.X11-unix/ \
        --volume "$HOME/.wine/drive_c/Program Files (x86)/Nostale":"/root/.wine/drive_c/Program Files (x86)/Nostale" \
        nostale
else
    xhost +
    docker run \
        -it \
        --env DISPLAY=$DISPLAY \
        --network=host \
        --name nostale \
        --privileged \
        --rm \
        --volume /tmp/.X11-unix/:/tmp/.X11-unix/ \
        --volume $HOME/.wine:/root/.wine \
        nostale
fi
