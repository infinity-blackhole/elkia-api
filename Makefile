GEN_ELKIA_APIS = \
	gen-elkia-api-erlang \
	gen-elkia-api-go

.PHONY: all
all: $(GEN_ELKIA_APIS)

.PHONY: gen-elkia-api-erlang
gen-elkia-api-erlang:
	@cp elkia-api/fleet/v1alpha1/fleet.proto elkia-api-erlang/protos
	@cp elkia-api/eventing/v1alpha1/eventing.proto elkia-api-erlang/protos
	@cp elkia-api/world/v1alpha1/world.proto elkia-api-erlang/protos
	@cp LICENSE elkia-api-erlang
	@cd elkia-api-erlang && rebar3 compile
	@cd elkia-api-erlang && rebar3 grpc gen

.PHONY: gen-elkia-api-go
gen-elkia-api-go:
	@protoc \
		--go_out=. \
		--go_opt=paths=import\
		--go-grpc_out=. \
		--go-grpc_opt=paths=import\
		elkia-api/fleet/v1alpha1/fleet.proto
	@protoc \
		--go_out=. \
		--go_opt=paths=import\
		--go-grpc_out=. \
		elkia-api/eventing/v1alpha1/eventing.proto
	@protoc \
		--go_out=. \
		--go_opt=paths=import\
		--go-grpc_out=. \
		--go-grpc_opt=paths=import\
		elkia-api/world/v1alpha1/world.proto
	@cp LICENSE elkia-api-go