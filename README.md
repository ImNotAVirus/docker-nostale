# docker-nostale

## Prerequisites

- Docker....
- A brain
- Some copy pasta skills

## Step 1/4: Build image

    docker build -t nostale .

## Step 2/4: Run image

    # Ye, I known `xhost +` is a bad practice but ¯\_(ツ)_/¯
    xhost + $(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
    docker run \
        -it \
        --env DISPLAY=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}'):0 \
        --name nostale \
        --privileged \
        --rm \
        --volume /tmp/.X11-unix/:/tmp/.X11-unix/ \
        --volume $HOME/.wine:/root/.wine \
        nostale

## Step 3/4: Install nostale

    wine nostale.exe

## Step 4/4: Start nostale

    # Forgot the Nostale path... If you have it, PM me xD
    # It's something like: "~/.wine/drive_c/Program Files (x86)/Nostale" 
    wine [... nostale path ...].NostaleClientX.exe EntwellNostaleClient

## Step 5/4: Restart your container afer stopped it

    docker start -ai nostale

## Todolist:

- [x] Basic features
- [ ] Clean this shit...
- [ ] Too much things to do....
