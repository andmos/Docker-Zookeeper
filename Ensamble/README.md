docker-zookeeper
================

A 5 node zookeeper ensemble that runs in Docker

Start ensemble by running:

    ./startup.sh
    
From the root of the project.

This will:

- Create a config container
- Create 5 zookeeper containers that wait for a config file to appear on the config container
- Generate the configuration
- Push the configuration into the config container
- Start the ensemble

>Inspired by [wouterd](https://github.com/andmos/Docker-Zookeeper.git)
