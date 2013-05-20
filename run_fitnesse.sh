#!/bin/bash

cd "${FITNESSE_HOME}" && java -jar "${FITNESSE_HOME}/lib/fitnesse-standalone.jar" \
	-p "${FITNESSE_PORT}" -e 0 -d ${PROJECT_ROOT}/src/test/rdbms/dbfit

