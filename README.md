# homelab

"A homelab goes a long way in IT" - my boss

## Tech Stack

### Hardware

-   **Server**: Raspberry Pi/Mini PC

The dream:

-   **Router**: self-hosted on Mini PC using open-source software.
-   **Network access point**: Ubiquiti Unifi 6 (Lite/Pro).

### Software

-   **Server host OS** - [Proxmox VE](https://proxmox.com/en/) (type 1 hyper-visor)
-   **Server guest OS** - [Ubuntu Server / Raspbian OS](https://ubuntu.com/download/server) (hosts containers)
-   **Container engine** - [Docker & Docker Compose](https://www.docker.com/)

The dream:

-   **Self-managed firewall OS** - [pfSense](https://www.pfsense.org/) (baremetal host OS on mini PC)
-   **Server guest OS** - [NixOS](https://nixos.org/) (to replace Ubuntu Server as guest SO to host containers)

## Services

-   [**LibreSpeed**](https://github.com/librespeed/speedtest): self-hosted speed test between client and router. 
-   [**Speedtest Tracker**](https://docs.speedtest-tracker.dev/): self-hosted monitoring of performance and uptime of your internet connection.
-   [**YouTube dl server**](https://github.com/nbr23/youtube-dl-server): web / REST interface for downloading youtube videos onto a server.

The dream:

todo

### Supporting Services

-   [**Caddy**](https://caddyserver.com/): reverse proxy and TLS cert management.
-   [**Watchtower**](https://github.com/containrrr/watchtower): automated container image updates.
-   [**Pushover**](https://pushover.net/): push notifications hook into services.
-   [**Gluetun**](https://github.com/qdm12/gluetun): VPN client in a thin Docker container

## Disclaimer

This was created as a learning exercise to upskill on various technologies, and is/has/will be only ever used for legally permissible purposes, such as obtaining media released to the public domain or sharing Linux ISOs.

