#!/bin/bash -e

GREEN='\033[0;32m'
NC='\033[0m' # No Color

PODSPEC=freewheel.podspec

help() {
  echo -e "Use ${GREEN}--lib${NC} or ${GREEN}-l${NC} to run ${GREEN}pod lib lint${NC}."
  echo -e "Use ${GREEN}--spec${NC} or ${GREEN}-s${NC} to run ${GREEN}pod spec lint${NC}."
  echo -e "Use ${GREEN}--push${NC} or ${GREEN}-p${NC} to push pod."
}

if [[ $1 == "-l" || $1 == "--lib" ]]
then
  echo -e "${GREEN}Lib lint Freewheel Pod${NC}"
  rvm 2.6.3 do bundle exec pod lib lint $PODSPEC --verbose --allow-warnings
elif [[ $1 == "-s" || $1 == "--spec" ]]
then
  echo -e "${GREEN}Spec lint Freewheel Pod${NC}"
  rvm 2.6.3 do bundle exec pod spec lint $PODSPEC --verbose --allow-warnings
elif [[ $1 == "-p" || $1 == "--push" ]]
then
  echo -e "${GREEN}Pushing Freewheel Pod${NC}"
  rvm 2.6.3 do bundle exec pod trunk push $PODSPEC --verbose --allow-warnings
else
  help
fi