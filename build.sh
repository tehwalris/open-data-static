#!/usr/bin/env bash

cd open-data-backend
python -m src.preprocess

cd ../open-data-frontend
# TODO env
yarn build
