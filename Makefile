.PHONY: protobuf
protobuf:
	protoc \
		--go_out=. \
		--go_opt=paths=import\
		--go-grpc_out=. \
		--go-grpc_opt=paths=import\
		elkia-api/fleet/v1alpha1/fleet.proto
	protoc \
		--go_out=. \
		--go_opt=paths=import\
		--go-grpc_out=. \
		elkia-api/eventing/v1alpha1/eventing.proto
	protoc \
		--go_out=. \
		--go_opt=paths=import\
		--go-grpc_out=. \
		--go-grpc_opt=paths=import\
		elkia-api/world/v1alpha1/world.proto
