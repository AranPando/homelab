# Secrets documentation

Documentation about the secrets

- [Secrets documentation](#secrets-documentation)
  - [Context](#context)
  - [Standards](#standards)
  - [puid\_guid.env](#puid_guidenv)
    - [PUID \& PGID](#puid--pgid)
  - [speedtest-tracker.env / gluetun-speedtest-tracker.env](#speedtest-trackerenv--gluetun-speedtest-trackerenv)
    - [APP\_KEY](#app_key)
  - [speedtest.env](#speedtestenv)
    - [PASSWORD](#password)
    - [EMAIL](#email)
  - [caddy.env](#caddyenv)
    - [DUCKDNS\_API\_TOKEN](#duckdns_api_token)
    - [ACME\_ACCOUNT\_EMAIL](#acme_account_email)
    - [DOMAIN\_LOCAL](#domain_local)
    - [DOMAIN\_VPN](#domain_vpn)
  - [gluetun.env](#gluetunenv)
    - [WIREGUARD\_PRIVATE\_KEY \& WIREGUARD\_ADDRESSES](#wireguard_private_key--wireguard_addresses)
  - [gluetun-config.toml](#gluetun-configtoml)
  - [qsticky.env](#qstickyenv)
    - [QBITTORRENT_API_KEY](#qbittorrent_api_key)
    - [GLUETUN_APIKEY](#gluetun_apikey)

## Context

Secrets are values which cannot/should not be pushed to Github (shared to the public internet).

These secrets live as values to environment variables; env variable name to value pairing:

`ENV_VAR_NAME="secret"`

These env variables live in a docker env file, and are imported by docker compose services using the `env_file` directive:

```docker-compose
env_file: 
  - path: ${SECRETS_PATH}/secrets_env_file.env
```

## Standards

1.  Environment variables are upper case, unless the importing service requires otherwise.
2.  Secrets (values to the environment variables) must be wrapped by (double) quotation marks, unless the importing service requires otherwise. See Watchtower

## puid_guid.env

```env
PUID
PGID
```

Include this .env file when the service requires the PUID & GUID values for the machine.

### PUID & PGID

Local user ID & group ID for volume permissions. It should match the user & group ID of the machine hosting the service. Without there could be some permissions issues.

## speedtest-tracker.env / gluetun-speedtest-tracker.env

```env
APP_KEY
```

### APP_KEY

Token generated from https://speedtest-tracker.dev/

## speedtest.env

```env
PASSWORD
EMAIL
```

### PASSWORD

Any random string. Used to login to the information panel.

### EMAIL

A chosen email address. Email address for GDPR requests. Must be specified when telemetry is enabled.

## caddy.env

```env
DUCKDNS_API_TOKEN
ACME_ACCOUNT_EMAIL
DOMAIN_LOCAL
DOMAIN_VPN
```

### DUCKDNS_API_TOKEN

The _token_ field on [www.duckdns.org](www.duckdns.org) after logging in.

### ACME_ACCOUNT_EMAIL

A chosen email address. Mainly used when creating an ACME account with your CA, and is highly recommended in case there are problems with your certificates.

### DOMAIN_LOCAL

Domain address which Caddy will server as a reverse proxy for, when trying to reach service from the home network.

On DuckDNS this is the domain for the IP address of the home server on the local home network.

### DOMAIN_VPN

Domain address which Caddy will server as a reverse proxy for, when trying to reach service from the Tailnet.

On DuckDNS this is the domain for the Tailnet IP address of the home server.

## gluetun.env

```env
WIREGUARD_PRIVATE_KEY
WIREGUARD_ADDRESSES
```

### WIREGUARD_PRIVATE_KEY & WIREGUARD_ADDRESSES

The process is VPN provider specific. For current provider (Proton VPN) go to https://account.protonvpn.com/downloads

The key and addresses are served when you "download" the wireguard config. Selected options:

- Platform: GNU/Linux
- VPN Options:
  - NAT-PMP (Port Forwarding)
  - VPN Accelerator
- Server: Aus #1

## gluetun-config.toml

API Authentication config file for the HTTP control server.

Goes together with: `GLUETUN_HTTP_CONTROL_SERVER_ENABLE=on`

```toml
[[roles]]
name = "qSticky"
routes = [
    "GET /v1/portforward",
    "GET /v1/vpn/status"
]
auth = "apikey"
apikey = "API-KEY-HERE"
```

Replace `API-KEY-HERE` with API key you want to have. Other services, e.g. qSticky, can use the API key to interact with gluetun API.

This file is mounted to gluetun

```docker-compose
 volumes:
  - ${SECRETS_PATH}/gluetun-config.toml:/gluetun/auth/config.toml  # Mount auth config
```

## qsticky.env

```env
QBITTORRENT_API_KEY
GLUETUN_APIKEY
```

### QBITTORRENT_API_KEY

Required to interact with qbittorrent API. Used to **set** the network connectivity port (for port forwarding)

Qbittorrent -> Settings -> Web UI -> Authentication -> API Key -> Generate (or copy if one already generated)

### GLUETUN_APIKEY

Required to interact with gluetun API. Used to **get** the VPN port-forwarding port.

Value is as set in `gluetun-config.toml` -> `apikey`.

## unpackerr.env

```env
UN_SONARR_0_API_KEY
UN_RADARR_0_API_KEY
```

Get/Generate API key from Sonarr/Raddar settings.
