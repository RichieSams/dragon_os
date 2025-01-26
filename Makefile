all: build

.PHONY: build
build:
	zig build -p ./build

.PHONY: clean
clean:
	rm -rf build .zig-cache

start_openocd:
	sudo openocd -f interface/cmsis-dap.cfg -c "adapter speed 5000" -f ./config/openocd/raspi5.cfg -s tcl
