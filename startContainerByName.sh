#!/bin/bash

docker start $(docker ps -aqf "name=cloudlite-typescript") && docker exec $(docker ps -aqf "name=cloudlite-typescript") nginx
