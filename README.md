# blessing-skin-docker

[**Unofficial**] [Blessing Skin Server](https://github.com/bs-community/blessing-skin-server) Docker image builder.

## Usage

Before running, copy SSL `cert.crt` and `cert.key` files into `certs/` folder
since blessing skin server requires HTTPS access.

- `make build`: Build blessing skin server docker image.
- `make run`: Run blessing skin server docker image just build in docker.

Then view `https://<ip-address>/` to set-up by refering the [document](https://github.com/bs-community/blessing-skin-server#readme) of the blessing skin project.

## Others

License: MIT
