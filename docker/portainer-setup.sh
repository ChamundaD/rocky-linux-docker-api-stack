#!/bin/bash

# Portainer setup script for Docker (CE version)

# Create persistent volume
docker volume create portainer_data

# Run Portainer container
docker run -d \
  --name=portainer \
  --restart=always \
  -p 9000:9000 \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v portainer_data:/data \
  portainer/portainer-ce

echo "✅ Portainer is now running at: http://localhost:9000"

#Make it executable (if local)
chmod +x docker/portainer-setup.sh

#Run it
./docker/portainer-setup.sh

#Open your browser to
http://localhost:9000


