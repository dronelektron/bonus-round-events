#!/bin/bash

PLUGIN_NAME="bonus-round-events"

cd scripting
spcomp $PLUGIN_NAME.sp -o ../plugins/$PLUGIN_NAME.smx
