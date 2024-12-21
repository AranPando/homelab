# Starr apps

## Hook up App to Prowlarr index

This will set up the app with the indexes to search for media

1. Get API key from the App you're looking to add

    In the app: `Settings` > `General` > `API Key`

2. Add a new app in Prowlarr, select the app you're adding.

3. Paste the app API key into `API Key` field.

4. Test connection. If doesn't work, play with URL.

## Connect a Download Client (qBittorrent)

This will set up the app with the download client to torrent the media

1. Add a new download connection

    `Settings` > `Download Client` > `+` > select the one.

2. Put the username and password of the login of your download client into `username` and `password` fields.

3. Set up category in download client 

    See [Starr tags management](/docs/media_server/starr_tags_management.md).

4. Name the category this app will match to in your download client.

    See [Starr tags management](/docs/media_server/starr_tags_management.md).

5. Test connection. If doesn't work, play with URL.

## Set Media Management

This will set the media quality settings & media saving location

1. Set quality settings: [TRaSH Guides - Recommended Quality Settings (Radarr)](https://trash-guides.info/Radarr/Radarr-Quality-Settings-File-Size/)
2. Set media naming scheme: [TRaSH Guides - Recommended naming scheme (Radarr)](https://trash-guides.info/Radarr/Radarr-recommended-naming-scheme/)
3. Set quality profiles: [TRaSH Guides - How to set up Quality Profiles](https://trash-guides.info/Radarr/radarr-setup-quality-profiles/)
4. Set the root folder.

    Root folder, is the folder that Radarr will place the media into once the download client finishes downloading, and where the media viewing client will find the media (aka `/data/media/`)