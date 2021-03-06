.PHONY: build
build:
	@go build -v .

.PHONY: clean
clean:
	go clean -i .

# Run and watch for file changes during development
.PHONY: dev
dev:
	@air

.PHONY: docker-build
docker-build:
	@docker build -t hello-world-api .

# Intended for https://github.com/bakeruk/kubernetes-hello-world-kustomization
.PHONY: docker-push-local
docker-push-local:
	@docker tag hello-world-api:latest localhost:5000/hello-world-api:latest && \
	docker push localhost:5000/hello-world-api:latest

.PHONY: docker-build-and-push-local
docker-build-and-push-local: docker-build docker-push-local

.PHONY: lint
lint:
	golint ./...

.PHONY: tools
tools:
	go install golang.org/x/lint/golint
	go install github.com/cosmtrek/air