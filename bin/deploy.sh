GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

quit_on_error() {
  if [[ $? != 0 ]]
  then
    exit
  fi
}

echo -e "${GREEN}Deploying Freewheel pod${NC}"
# Validate architectures
./bin/archs.sh -v

quit_on_error

# Validate version format: X.X.X
./bin/version.sh -v

quit_on_error

# Validate pod & podspec
./bin/pod.sh -v

quit_on_error

# Push pod
./bin/pod.sh -p