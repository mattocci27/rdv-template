#!/bin/bash

scripts/setup_dev_container.sh
scripts/make_renviron.sh

# Define the path to the apptainer.sif file
sif_file="apptainer.sif"

# Check conditions and build apptainer.sif from apptainer.def if applicable
if [ ! -f "/.dockerenv" ] && [ ! -f "$sif_file" ] && which apptainer > /dev/null; then
    echo "Building apptainer.sif from apptainer.def..."
    sudo apptainer build apptainer.sif apptainer.def
else
    echo "Conditions not met for building apptainer.sif."
fi
