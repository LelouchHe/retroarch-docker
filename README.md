# Run retroarch in container on arm64 machine

* build: `docker build -t retroarch .`
* run: `docker run -d --name retroarch -v /path/to/retroarch_data:/root/retroarch_data -p 9090:80 retroarch`

In `retroarch_data`, there should be 5 folders:

1. `cores`: required. since retroarch doesn't support arm64 officially, the cores can't be updated online. You need to have them ready when playing it. Possible source: [https://github.com/christianhaitian/retroarch-cores]
2. `rom`: required. rom folders
3. `system`: required for some platforms that need special bios
4. `playlists`: optional. you can have retroarch to scan your roms to get one
5. `thumbnails`: optional. you can have retroarch to download the arts

All directories can be changed from retroarch. This is just what works for me.

# Remaining issue

1. sound is sometimes broken. the screen can't be too large, or the sound will be terrible.
2. Chinese locale doesn't work

# Original README

# RETRTOARCH IN A CONTAINER PLAYABLE THROUGH A BROWSER

[<img src="retroarch.jpg" width="50%">](https://www.youtube.com/watch?v=6gqXNirjNeU "RETRTOARCH IN A CONTAINER")

RetroArch in a container typically requires that you have some kind of specialized client to play the games over the network. Not anymore. This implementation uses a web browser as the client without the need for anything else installed on your client.

The implementation is pretty straightforward. You can run it locally, or run it on a cloud-hosted service, like Azure Container Instances or Azure Kubernetes Services. In any case, you'll probably want to allocate at least 2 Gigs of RAM and 2 CPUs to make things run smoothly -- more for more graphic-intense emulators.

If you want to build it, simply clone the repo and run Docker Build.

`docker build -t retroarch . `

Alternately, you can pull the image from Docker Hub.

`docker pull blaize/retroarch`

To run this locally, run a Docker command:

`docker run -v /path/to/your/roms:/roms -p 80:80 blaize/retroarch`

Once the container is running, point your browser to the IP address or host name of your Docker environment. Retroarch has a basic install here.

***The Arrow Keys DO NOT WORK for some reason. Use the Num Pad to navigate or remap the keys in settings to your liking.***

1. On the Main Menu, go to and select "Update Core Info Files" and "Update Assets" to get the UI refreshes and a list of available Cores.
2. From th "Core Downloader," download your platform of choice.
3. Back on the Main Menu, select "Load Content" and browse to the folder `/roms` Pick your game and it will launch it.

Enjoy your retro gaming platform in the cloud!
