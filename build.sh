#!/usr/bin/env bash

cd open-data-backend
./download-data.sh
python -m src.preprocess

cd ../open-data-frontend
# TODO env
yarn build
