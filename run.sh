BUILD_OPTION="--no-build"

# Should build
if [ "$1" == "-b" ];
then
    BUILD_OPTION="--build"
fi

echo "Running... 'docker-compose up $BUILD_OPTION'"
docker-compose up -d $BUILD_OPTION
