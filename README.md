# Envoy filter with Rust and WebAssembly

This is a demo accompanying a blogpost about building Envoy filters with Rust and WebAssembly.

## Getting started

1. Install WebAssembly target for rust

   ```sh
   $ rustup update
   $ rustup target add wasm32-unknown-unknown
   ```

2. Install [wasme](https://docs.solo.io/web-assembly-hub/latest/reference/cli/)

   ```sh
   $ curl -sL https://run.solo.io/wasme/install | sh
   $ export PATH=$HOME/.wasme/bin:$PATH
   ```

3. Clone the repo and use the makefile to build and run the demo:

   ```sh
   $ make build-image
   $ make deploy-envoy
   ```

Now you can open <http://localhost:8080/headers>. This is proxying to <http://httpbin.org/headers>, reflecting request headers back at you. You should see

```
"X-Hello": "Hello world from localhost:8080"
```

which was injected by the filter.
