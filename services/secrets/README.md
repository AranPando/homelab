# Secrets documentation

Documentation about the secrets

- [Secrets documentation](#secrets-documentation)
  - [Context](#context)
  - [Standards](#standards)
  - [caddy.env](#caddyenv)
    - [DUCKDNS\_API\_TOKEN](#duckdns_api_token)
    - [ACME\_ACCOUNT\_EMAIL](#acme_account_email)
    - [DOMAIN\_LOCAL](#domain_local)
    - [DOMAIN\_VPN](#domain_vpn)
  - [gluetun.env](#gluetunenv)
    - [OPENVPN\_USER \& OPENVPN\_PASSWORD](#openvpn_user--openvpn_password)
    - [SERVER\_COUNTRIES](#server_countries)
    - [SERVER\_CITIES](#server_cities)
  - [speedtest-tracker.env / gluetun-speedtest-tracker.env](#speedtest-trackerenv--gluetun-speedtest-trackerenv)
    - [APP\_KEY](#app_key)
    - [PUID \& PGID](#puid--pgid)
  - [speedtest.env](#speedtestenv)
    - [PASSWORD](#password)
    - [EMAIL](#email)
  - [watchtower.env](#watchtowerenv)

## Context

Secrets are values which cannot/should not be pushed to Github (shared to the public internet).

These secrets live as values to environment variables; env variable name to value pairing:

`ENV_VAR_NAME="secret"`

These env variables live in a docker env file, and are imported by docker compose services using the `env_file` directive:

```
env_file: 
  - path: ${SECRETS_PATH}/secrets_env_file.env
```

## Standards

1.  Environment variables are upper case, unless the importing service requires otherwise.
2.  Secrets (values to the environment variables) must be wrapped by (double) quotation marks, unless the importing service requires otherwise. See Watchtower

## caddy.env

```
DUCKDNS_API_TOKEN
ACME_ACCOUNT_EMAIL
DOMAIN_LOCAL
DOMAIN_VPN
```

### DUCKDNS_API_TOKEN

The _token_ field on www.duckdns.org after logging in.

### ACME_ACCOUNT_EMAIL

A chosen email address. Mainly used when creating an ACME account with your CA, and is highly recommended in case there are problems with your certificates.

### DOMAIN_LOCAL

Domain address which Caddy will server as a reverse proxy for, when trying to reach service from the home network.

On DuckDNS this is the domain for the IP address of the home server on the local home network.

### DOMAIN_VPN

Domain address which Caddy will server as a reverse proxy for, when trying to reach service from the Tailnet.

On DuckDNS this is the domain for the Tailnet IP address of the home server.

## gluetun.env

```
OPENVPN_USER
OPENVPN_PASSWORD
SERVER_COUNTRIES
SERVER_CITIES
```

### OPENVPN_USER & OPENVPN_PASSWORD

The process is VPN provider specific. For current provider (Proton VPN) go to https://account.proton.me/u/0/vpn/OpenVpnIKEv2

For all other Gluetun instructions for Proton VPN go to: https://github.com/qdm12/gluetun-wiki/blob/main/setup/providers/protonvpn.md

### SERVER_COUNTRIES

Comma separated list of countries whose servers to connect to.

The list of available countries is VPN provider specific. See at https://account.proton.me/u/0/vpn/OpenVpnIKEv2

### SERVER_CITIES

Comma separated list of cities whose servers to connect to.

The list of available cities is VPN provider specific. See at https://account.proton.me/u/0/vpn/OpenVpnIKEv2

## speedtest-tracker.env / gluetun-speedtest-tracker.env

```
APP_KEY
PUID
PGID
```

### APP_KEY

Token generated from https://speedtest-tracker.dev/

### PUID & PGID

local user ID & group ID for volume permissions. It should match the user & group ID of the machine hosting the service. Without there could be some permissions issues.

## speedtest.env

```
PASSWORD
EMAIL
```

### PASSWORD

Any random string. Used to login to the information panel.

### EMAIL

A chosen email address. Email address for GDPR requests. Must be specified when telemetry is enabled.

## watchtower.env

```
PUSHOVER_API_TOKEN
PUSHOVER_USER_KEY
PUSHOVER_DEVICES
WATCHTOWER_NOTIFICATION_URL
WATCHTOWER_NOTIFICATIONS_HOSTNAME
```
