#!/bin/bash

# Update the UID and GID for rstudio, using environment variables
usermod -u ${HOST_UID} rstudio
groupmod -g ${HOST_GID} rstudio

# Fix ownership in the home directory (optional, might be needed)
chown -R rstudio:rstudio /home/rstudio

# Execute the Docker CMD
exec "$@"

