all: build

.PHONY: build
build:
	zig build -p ./build

.PHONY: clean
clean:
	rm -rf build .zig-cache
