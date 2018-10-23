#!/bin/sh

source ./utils.sh

echo -e "${lpurp}Building chrome container${NC}" 
docker build --rm -t chrome .
