BUILD_OPTION="--no-build"

# Should build
if [ "$1" == "-b" ];
then
    BUILD_OPTION="--build"
fi

echo "Running... 'docker-compose -f docker-compose.fresh.yml up $BUILD_OPTION'"
docker-compose -f docker-compose.fresh.yml up -d $BUILD_OPTION
