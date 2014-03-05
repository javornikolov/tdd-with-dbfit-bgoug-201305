#!/bin/bash

PROJECT_NAME=dbfitdemo

ROOT_DIR=`dirname ${0}`

cd "${ROOT_DIR}" || { echo 'Cannot change to $ROOT_DIR'; exit 1; }
ROOT_DIR=`pwd`

PROJECT_ROOT="${ROOT_DIR}/${PROJECT_NAME}"

cd "${ROOT_DIR}"

export PROJECT_ROOT

nohup ./run_fitnesse.sh >run_fitnesse.log 2>&1 &

