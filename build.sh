#!/usr/bin/env bash

trap "kill 0" EXIT

cd open-data-backend
# python -m src.preprocess
uvicorn main:app &
python -m src.static

cd ../open-data-frontend
# REACT_APP_API_URL='https://ask-open-data.ch/api' yarn build

cd ..
rm -rf build
cp -R open-data-frontend/build build
cp -R open-data-backend/static build/api
ls -lah build
