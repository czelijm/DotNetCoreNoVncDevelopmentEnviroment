# DotNetCoreNoVncDevelopmentEnviroment

## Run commands:
docker run -it --rm -p 5901:5901 -p 6901:6901 -p 5000:5000 -p 3000:3000 -v \`pwd -W`:/usr/src/app -u root IMAGE_NAME

docker exec -it -u root -w /usr/src/app CONTAINER_NAME bash