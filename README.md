# Samba in Docker

Build image

```bash
docker build -t samba .
```

Change to the directory you want to mount as samba root directory (or you can replace the directory with `"${PWD}"`), and configure password. Also, the first `445` is the port the host to use.

```bash
docker run -itd -p 445:445 -v "${PWD}":/root/sambashare --name samba-server samba && docker attach samba-server
```

Start container

```bash
docker start samba-server
```
