# Standalone Stellar private blockchain - Node implementation
This repository contains a docker-compose implementation of a Stellar validator node that runs on a fully private blockchain, separated from the "public" and "test" one. This repository is the implementation of a single node. In order to create a fully private blockchain you have to deploy this docker-compose architecture on multiple machines.

### Configuration files
Before running this docker-compose architecture you have to configure the following files:
* `core/stellar-core.cfg` : in this file you need to change only fee parameters (`NETWORK_PASSPHRASE`, `NODE_SEED`, `NODE_HOME_DOMAIN` and the list of validators). The remaining parameters should not be changed 
* `horizon/horizon.conf`: in this file you only have to change the `NETWORK_PASSPHRASE` to the value you set in the stellar configuration file, and the `HISTORY_ARCHIVE_URLS` which contains a list of urls where the horizon is going to fetch archives.

### Run 
Before running make sure to configure all the files as discussed in the previous paragraph. After that run the node by executing the following command in the directory containing the `docker-compose.yml` file
```
docker-compose up
```
### Building Requirements
* [Docker](https://docs.docker.com/get-docker/)
