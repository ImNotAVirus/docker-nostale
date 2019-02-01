# docker-nostale

## Prerequisites

- Docker....
- A brain
- Some copy pasta skills

## Step 1/4: Build image

    docker build -t nostale .

## Step 2/4: Run image

    ./start_nostale.sh

## Step 4/4: Start nostale

    # Forgot the Nostale path... If you have it, PM me xD
    # It's something like: "~/.wine/drive_c/Program Files (x86)/Nostale" 
    wine [... nostale path ...].NostaleClientX.exe EntwellNostaleClient

## Step 5/4: Restart your container after stopped it

    docker start -ai nostale

## Todolist:

- [x] Basic features
- [ ] Clean this shit...
- [ ] Too much things to do....
