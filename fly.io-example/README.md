This is an example of pocketbase running on fly.io backed by litefs + sqlite.

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
