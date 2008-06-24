#!/bin/bash
source config.sh
init;

mkdir "$APP_DEFAULT_DIR"
cp * "$APP_DEFAULT_DIR"
ln -s  "$APP_DEFAULT_DIR"/"$SHORT_NAME" /usr/bin/$SHORT_NAME
