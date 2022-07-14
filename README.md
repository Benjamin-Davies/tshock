# TShock Dockerfile

## Usage

TShock is somewhat annoying as it requires user interaction when run.

To build the image and create a container, run:

```sh
docker build -t tshock .
docker create -it -p 7777:7777 -v $PWD/tshock:/app/tshock -v $PWD/Terraria:/root/.local/share/Terraria -e WORLD=world-name-here --name tshock tshock
```

Replacing `world-name-here` with the name of your world file.

If migrating from uncontainerized TShock, you can find these folders at `./tshock` and `~/.local/share/Terraria` (may be `/root/.local/share/Terraria`, see [#2021](https://github.com/Pryaxis/TShock/discussions/2021#discussioncomment-379430)). You should just be able to copy them into the current directory, or edit the `docker create` command above to refer to the old directories (don't forget to use absolute paths).

To start the server, run:

```sh
docker start tshock
```

To stop the server: run `docker attach tshock` and press CTRL-C

### Create a new world

To create a new world, run the following command and follow the instructions (the container must already be built):

```sh
docker run --rm -it -p 7777:7777 -v $PWD/tshock:/app/tshock -v $PWD/Terraria:/root/.local/share/Terraria tshock mono TerrariaServer.exe
```
