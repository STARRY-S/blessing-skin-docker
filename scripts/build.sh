#!/bin/bash

cd $(dirname $0)/..

docker build --no-cache -t bs-server .
