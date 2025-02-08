#!/bin/bash
APP_DIRECTORY_NAME=lanimjs
WORKSPACE_DIRECTORY_NAME=workspace

git clone https://github.com/JosueCA/lanimjs $APP_DIRECTORY_NAME
cd $APP_DIRECTORY_NAME
npm install
npm run electron-builder
