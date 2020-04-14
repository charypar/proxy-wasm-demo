.PHONY: release build-image deploy-envoy

release:
	cargo build --target wasm32-unknown-unknown --release

build-image: release	
	cp target/wasm32-unknown-unknown/release/hello_world.wasm ./
	wasme build precompiled hello_world.wasm --tag hello_world:v0.1
	rm hello_world.wasm

deploy-envoy:
	wasme deploy envoy hello_world:v0.1 --envoy-image=istio/proxyv2:1.5.1 --bootstrap=envoy-bootstrap.yml

push-image: 
	wasme tag hello_world:v0.1 webassemblyhub.io/charypar/rust_hello_world:v0.1
	wasme push webassemblyhub.io/charypar/rust_hello_world:v0.1
