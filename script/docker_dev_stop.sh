#!/bin/bash

set -e

docker-compose -f docker-compose.yml -f docker-compose.override.yml -f docker-compose.development.yml stop
