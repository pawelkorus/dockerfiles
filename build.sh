#!/bin/sh

source ./utils.sh

echo -e "${lpurp}Building image${NC}" 
docker build --rm -t pawelkorus/base-gui-app .
