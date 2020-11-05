# Dotnet 5.0 RC Alpine docker images

## compile
`bash
dotnet publish -p:PublishTrimmed=True -p:PublishSingleFile=true -r alpine-x64 -c Release
`

## Docker Build
`bash
docker build --pull --rm -f Dockerfile -t publish:latest .
`

## Docker Run
`bash
docker run --rm -it  -p 443:443/tcp -p 8080:8080/tcp publish:latest
`
