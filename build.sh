#!/usr/bin/env bash

trap "kill -- -$BASHPID" EXIT

cd open-data-backend
# HACK start the server early to make sure it is ready when src.static runs
uvicorn main:app &
python -m src.preprocess
python -m src.static

cd ../open-data-frontend
REACT_APP_API_URL='https://ask-open-data.ch/api' yarn build

cd ..
rm -rf build
cp -R open-data-frontend/build build
cp -R open-data-backend/static build/api
ls -lah build
