# WP_INSTALLER
Script which install WordPress locally easily

This script require WP-CLI

You can download wp-cli.phar like this :
```sh
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
```

## Start script
- Download `install.sh` from this repo or by cUrl :
```sh
curl -s https://raw.githubusercontent.com/gturpin-dev/wp_installer/main/install.sh -o install.sh
```
- Give the good rights if not `chmod u+x install.sh`
- Launch the script `./install.sh`
- Start a localhost, for example `php -S localhost:8000`

## Features
- Create your Database and link it with you WP
- Create your wp-config file and set debug true
- Set revisions limit to 3 (optimisation)
- Install your wordpress at `localhost:8000`
- Set the admin user with id of 2 (security)
- Set the permalinks structure to `/%postname%/`
- Delete all sample stuff (plugins, posts, pages, themes)
- Disable indexing
- Default activate fr_FR version
- Install the latest WP theme actually `twentytwentyone`
- Clean the script file