# qBittorent

## Volume mounts

qBittorent downloads go into `/downloads` folder, mounted into the `data/downloads/` directory on the host. This is intended for configuration simplicity.

qBittorent is configured to save downloads to the following folders under the mounted `downloads`:

1. `downloads/complete` - for completed torrents
2. `downloads/incomplete` - for in-progress torrents
3. `downloads/torrents` - for the `.torrent` files

At the moment, this was configured manually from the WebUI - until I find a way to manage the service from config.

## Test connection through Gluetun

With qBit up and running, and gluetun service healthy, torrent the link at [Whatismyi's Torrent Tracker IP Checker](https://www.whatismyip.net/tools/torrent-ip-checker/index.php?hash=3d0fd31d34790d192f61e94ef797ad904150d57c).

This tracker will show you the IP that is coming from qbittorent. If the IP showing is the server's IP OR not Gluetun's IP, there is a leak in the VPN connection.