const mmio = @import("arch/mmio.zig");

export fn system_init() void {}

export fn kernel_main() callconv(.C) noreturn {
    // Make sure the status LED is set to output
    mmio.setPinOutput(mmio.GIO_ALWAYS_ON_BANK0_IO_DIR, mmio.GIO_ALWAYS_ON_BANK0_LINE_2712_STAT_LED);

    while (true) {
        ledOff();
        delayLoop(1000000);
        ledOn();
        delayLoop(1000000);
    }
}

/// Delay by spinning in a loop.
fn delayLoop(numCycles: u32) void {
    var iter: u32 = 0;
    const iterPtr: *volatile u32 = &iter;

    while (iterPtr.* < numCycles) {
        iterPtr.* += 1;
    }

    return;
}

fn ledOff() void {
    mmio.GIO_ALWAYS_ON_BANK0_DATA.* &= ~@as(u32, mmio.GIO_ALWAYS_ON_BANK0_LINE_2712_STAT_LED);
}

fn ledOn() void {
    mmio.GIO_ALWAYS_ON_BANK0_DATA.* |= @as(u32, mmio.GIO_ALWAYS_ON_BANK0_LINE_2712_STAT_LED);
}
