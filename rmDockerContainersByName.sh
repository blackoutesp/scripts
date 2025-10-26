#!/bin/bash

docker rm $(docker ps -aqf "name=$1")
