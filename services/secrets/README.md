# Secrets documentation

Documentation about the secrets

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
```

### OPENVPN_USER & OPENVPN_PASSWORD

The process is VPN provider specific. For current provider (Proton VPN) see: https://github.com/qdm12/gluetun-wiki/blob/main/setup/providers/protonvpn.md

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

todo