.prepare:
	./scripts/prepare.sh

build: .prepare
	./scripts/build.sh

run:
	./scripts/start.sh

.default:
	@echo "Usage:"
	@echo "    make build -- Create bs server docker image."
	@echo "    make run   -- Run bs server in docker."

clean:
	@rm server.zip

.DEFAULT_GOAL:= .default

.PHONY: build run clean