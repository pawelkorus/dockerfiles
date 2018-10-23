#!/bin/sh

source ./utils.sh

# Launch syncomm/spotify container 
echo -e "${lpurp}Launching  spotify container${NC}" 
echo docker run --rm --name spotify \
  --privileged \
  --device /dev/snd \
  -v ~/data:/config \
  -p 5800:5800 \
  -p 5900:5900 \
  spotify | sh
  
