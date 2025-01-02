all: build

.PHONY: build
build:
	zig build -p ./build
