# Samba in Docker

## Usage

Step 1. Build image

```bash
docker buildx build -t samba .
```

Step 2. Configure

Change to the directory you want to mount as samba root directory (or you can replace the directory with `"${PWD}"`), and configure password. Also, the first `445` is the port the host to use.

```bash
docker run -itd -p 445:445 -v "${PWD}":/root/sambashare --restart always --name samba-server samba && docker attach samba-server
```

Step 3. Start container

```bash
docker start samba-server
```

Step -1. Maintain

Every time after booting, you just have to start the docker

While logging in, the user should be `root` and password should be what you have set. The directory would just be `share`. You can change it here in config file.

https://github.com/JeffersonQin/samba-docker/blob/5659476bb6ca8c645e89be12210896f9671e57c3/smb.conf#L1

All other configurations are set to default for samba. If you have to change other settings, you can simply rewrite the config, and change the redirection symbol from `>>` into `>` here in the script.

https://github.com/JeffersonQin/samba-docker/blob/5659476bb6ca8c645e89be12210896f9671e57c3/Dockerfile#L7

## Known Issues

* due to some permission issues occurred while mounting, the user of samba is set to root
