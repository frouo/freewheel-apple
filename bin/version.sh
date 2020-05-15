#!/bin/bash -e

GREEN="\033[0;32m"
RED="\033[0;31m"
NC="\033[0m" # No Color

IOS_VALIDATION_RESULT=0
TVOS_VALIDATION_RESULT=0

help() {
  echo -e "Use ${GREEN}iOS${NC} or ${GREEN}tvOS${NC} as parameter to know the version of the corresponding framework."
  echo -e "Use ${GREEN}--validate${NC} or ${GREEN}-v${NC} to validate the version format for each framework."
}

version_for_os() {
  /usr/libexec/PlistBuddy -c "Print CFBundleShortVersionString" "$1/AdManager.framework/Info.plist"
}

number_of_components() {
  result=$(echo $1 | tr -dc . | wc -c) # take version number, take the points in it, count them
  echo $result
}

validate_for_os() {
  result=1
  version=$(version_for_os $1)
  comps=$(number_of_components $version)

  if [[ $comps -le 2 ]]
  then
    result=0
    echo -e "${GREEN}Valid version format for $1.${NC}"
  fi

  if [[ $result != 0 ]]
  then
    echo -e "${RED}Invalid version format for $1.${NC}"

    if [[ $1 == iOS ]]
    then
      IOS_VALIDATION_RESULT=1
    elif [[ $1 == tvOS ]]
    then
      TVOS_VALIDATION_RESULT=1
    fi
  fi
}

if [[ $1 == iOS || $1 == tvOS ]]
then
  version_for_os $1
elif [[ $1 == "-v" || $1 == "--validate" ]]
then
  echo -e "${GREEN}Validating version format in Freewheel frameworks.${NC}"

  validate_for_os iOS
  validate_for_os tvOS

  if [[ $IOS_VALIDATION_RESULT != 0 || $TVOS_VALIDATION_RESULT != 0 ]]
  then
    exit 1
  fi
else
  help
fi
