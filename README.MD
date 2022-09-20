# Docker Pocketbase

- [Docker Pocketbase](#docker-pocketbase)
  - [Getting Started](#getting-started)
  - [Notes](#notes)
  - [Production](#production)

## Getting Started

1. Clone this repo

```bash
git clone https://github.com/insuusvenerati/docker-pocketbase
```

2. Build the image

```bash
docker build -t pocketbase .
```

> Optionally supply a build arg specifying the version i.e. `--build-args VERSION=0.7.2`

3. Deploy the container

```bash
docker run -it --rm -p 8090:8090 pocketbase:latest
```

or

```bash
docker-compose up
```

> Be sure to review the `docker-compose.yml` file and adjust your setup as necessary.

## Notes

A list of some things that may impact your deployment.

- The container runs as the user `pocketbase` `uid=1000(pocketbase) gid=1000(pocketbase) groups=1000(pocketbase)`.
  See the [docker-cli](<[https://](https://docs.docker.com/engine/reference/run/#user)>) and [docker-compose](<[https://](https://docs.docker.com/compose/compose-file/#user)>) references online for information on how to change this at runtime.

- Data is saved under `/home/pocketbase/pb_data` by default which is owned by the `pocketbase (1000)` user.

- `pb_public` is not implemented in this repo yet.

## Production

> THIS IS NOT A SECURE WAY TO RUN POCKETBASE BY DEFAULT

See https://pocketbase.io/docs/going-to-production/ for more information on running in production.
