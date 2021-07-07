#!/usr/bin/env bash

## How to use this shell script
# caver-java-examples$ ./setup.sh <common-architecture-layer>/<scenario>
# e.g. $ ./setup.sh account/update_account_with_account_key_weighted_multisig
##

PROJECT_ROOT_DIR=$PWD
ASSETS_DIR=$PROJECT_ROOT_DIR/assets
BUILD_GRADLE="build.gradle"
BOILER_PLATE_BUILD_GRADLE=$ASSETS_DIR/buildGradle
BOILER_PLATE_TEMPLATE=$ASSETS_DIR/Boilerplate.java
NEW_SCENARIO=$1
NEW_SCENARIO_SRC_ROOT=$NEW_SCENARIO/src/main/java

## Tokenize $NEW_SCENARIO
# input: account/update_account_with_account_key_weighted_multisig
# then => COMMON_ARCHITECTURE_LAYER: account, SCENARIO_NAME: update_account_with_account_key_weighted_multisig
ARR_IN=(${NEW_SCENARIO//\// })
ARR_LEN=${#ARR_IN[@]}
COMMON_ARCHITECTURE_LAYER_NAME=${ARR_IN[0]}
SCENARIO_NAME=${ARR_IN[$ARR_LEN - 1]}
##

echo "Create project structure for $NEW_SCENARIO\n"

mkdir -p $NEW_SCENARIO

gradle init --type basic --dsl groovy --project-name=$SCENARIO_NAME --project-dir=$NEW_SCENARIO
mkdir -p $NEW_SCENARIO_SRC_ROOT
cp $BOILER_PLATE_BUILD_GRADLE $NEW_SCENARIO/$BUILD_GRADLE
cp $BOILER_PLATE_TEMPLATE $NEW_SCENARIO_SRC_ROOT
