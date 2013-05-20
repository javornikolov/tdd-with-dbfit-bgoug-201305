#!/bin/bash

PROJECT_NAME=dbfitdemo

FITNESSE_HOME=/u01/app/dbfit
FITNESSE_PORT=8981

ROOT_DIR=`dirname ${0}`

cd "${ROOT_DIR}" || { echo 'Cannot change to $ROOT_DIR'; exit 1; }
ROOT_DIR=`pwd`

PROJECT_ROOT="${ROOT_DIR}/${PROJECT_NAME}"

cd "${ROOT_DIR}"

export PROJECT_ROOT FITNESSE_HOME FITNESSE_PORT

nohup ./run_fitnesse.sh >run_fitnesse.log 2>&1 &

