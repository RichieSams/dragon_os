const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.resolveTargetQuery(.{
        .cpu_arch = .aarch64,
        .cpu_model = .{ .explicit = &std.Target.arm.cpu.cortex_a76 },
        .os_tag = .freestanding,
        .abi = .eabihf,
    });

    const exe = b.addExecutable(.{
        .name = "kernel.elf",
        .target = target,
        .optimize = std.builtin.Mode.ReleaseFast,
        .link_libc = false,
        .linkage = .static,
        .root_source_file = b.path("kernel/main.zig"),
    });
    exe.addAssemblyFile(b.path("kernel/boot.S"));

    exe.setLinkerScriptPath(b.path("kernel/linker.ld"));

    exe.link_gc_sections = true;
    exe.link_data_sections = true;
    exe.link_function_sections = true;

    // Produce .bin file from .elf
    const bin = b.addObjCopy(exe.getEmittedBin(), .{
        .format = .bin,
    });
    bin.step.dependOn(&exe.step);
    const copy_bin = b.addInstallBinFile(bin.getOutput(), "kernel.bin");
    b.default_step.dependOn(&copy_bin.step);

    // Produce .hex file from .elf
    const hex = b.addObjCopy(exe.getEmittedBin(), .{
        .format = .hex,
    });
    hex.step.dependOn(&exe.step);
    const copy_hex = b.addInstallBinFile(hex.getOutput(), "kernel.hex");
    b.default_step.dependOn(&copy_hex.step);

    b.installArtifact(exe);
}
