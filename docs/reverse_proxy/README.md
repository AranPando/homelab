# Reverse Proxy Setup

Reverse proxy and Domain Name Resolution is made up of two critical components:

1.  [DuckDNS](https://www.duckdns.org/): free domain registration
2.  [Caddy](https://caddyserver.com/): reverse proxy & TLS management

It's also worth noting Tailscale, as it has lead to the creation of additional DNS entries.

## DuckDNS

DuckDNS has made it really easy & inexpensive to get up a domain name for servers.

DuckDNS domains all end with `.duckdns.org`.

"Subdomains" of `duckdns.org` are created and matched to an IP address.

In my case, I require two domains:

1.  DOMAIN_LOCAL: used when accessing services when on HOME network.
2.  DOMAIN_VPN: used when accessing services when on TAILNET network (Tailscale VPN).

Both domains are defined in `secrets/caddy.env` and interpreted by Caddy in Caddyfile.

## Caddy

Caddy enables domain access to web services hosted on containers.

The reverse proxy and domain-to-service resolution is defined in `Caddyfile`.