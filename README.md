# Nzyme-docker

#### Current intent
Deploy x1 nzyme-node and x1 nzyme-tap using docker compose.

#### Final Intent
A fully functional nzyme deployment (multi node) with minimal configuration using containers with docker compose.

#### Status
Trying to get tap working.

## Deployment
The current intent is to use docker-compose. The main attractions towards compose is its ease of use and ability to quickly update our services. 

#### Nzyme.conf (nzyme-node)
Nzyme configuration a deploy time resource. This allows us to easily add, update, or remove configuration without having to rebuild images.

## Todo: 
Reading 'todo' in Github Repo projects.

## Setup
1. Create build nzyme components using docker bake. 
2. Ammend values in .env file. 
3. Run `docker-compose up -d`. 

#### Nzyme tap config 
You can auto generate `nzyme-tap` configuration using the `generate_tap_conf.sh` script. Run this script against machine that will run `nzyme-tap` and ensure the adapters are connected.

## Notes:

- There is currently no way to disable MFA.