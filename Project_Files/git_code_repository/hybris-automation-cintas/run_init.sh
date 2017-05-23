#!/bin/sh
# Initiates and updates hybris-automation-shared the submodule

echo “Initiate the submodule”
git submodule init
echo “update the submodule”
git submodule update
