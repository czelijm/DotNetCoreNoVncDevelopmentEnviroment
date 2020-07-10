# DotNetCoreNoVncDevelopmentEnviroment

## Run commands:
docker run -it --rm -p 5901:5901 -p 6901:6901 -p 5000:5000 -p 3000:3000 -v `pwd -W`:/usr/src/app -u root ed707
docker exec -it -u root -w /usr/src/app ae bash