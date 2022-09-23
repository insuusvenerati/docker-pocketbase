This is an example of pocketbase running on fly.io backed by litefs + sqlite.

> NOTE: At the moment this does not work as WAL mode, used by pocketbase, is not supported yet. https://community.fly.io/t/litefs-wal-mode/7325

> See https://fly.io/docs/litefs/getting-started/ for a contrived example of litefs on fly.io.

# Getting Started

- Clone this repo and cd to `fly.io-example/`

```bash
git clone https://github.com/insuusvenerati/docker-pocketbase
cd fly.io-example
```

- Install [flyctl](https://fly.io/docs/hands-on/install-flyctl/)

- Set your app name in fly.toml

```toml
app = "example-pocketbase"
```

- Deploy the app on fly.io

```bash
fly deploy .
```
