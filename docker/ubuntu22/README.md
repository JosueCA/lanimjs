# Build with Docker
- Build image  
```
docker build -t lanimjs:build .
```
- Run docker image  
```
docker run -it -v ./workspace:/home/lanimjs/workspace lanimjs:build
```

- Execute the build.sh script, inside the container  
```
../build.sh
```
The AppImage should be create inside de 'dist' folder. Accesible from the 'host' inside the 'workspace' directory