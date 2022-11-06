# blessing-skin-docker

[**Unofficial**] [Blessing Skin Server](https://github.com/bs-community/blessing-skin-server) Docker image builder.

## Usage

Copy SSL `cert.crt` and `cert.key` files into `certs/` folder before building.

- `make build`: Build blessing skin server docker image.
- `make run`: Run blessing skin server docker image just build in docker.

Otherwise, you can use following command to customise your docker parameters.

```sh
docker run -v $(pwd)/certs:/certs \
    -v $(pwd)/html:/server/html \
    -d -p 80:80 -p 443:443 \
    --name bs-server \
    --privileged \
    bs-server
```

You can use `-v $(pwd)/default.conf:/etc/nginx/sites-enabled/default` parameter to customize nginx configuration after this server is first-initialized.

```sh
# Create an empty configuration file.
touch default.conf

# Run container
docker run -v $(pwd)/certs:/certs \
    -v $(pwd)/html:/server/html \
    -v $(pwd)/default.conf:/etc/nginx/sites-enabled/default \
    --restart=unless-stopped \
    -d -p 80:80 -p 443:443 \
    --name bs-server \
    --privileged \
    bs-server

# Edit thenginx server configuration and restart container
vim default.conf
docker restart bs-server
```

Then view `https://<ip-address>/` to set-up by refering the [document](https://github.com/bs-community/blessing-skin-server#readme) of the blessing skin project.

## Others

License: MIT
