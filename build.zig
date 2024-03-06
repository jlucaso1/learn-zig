const std = @import("std");

pub fn build(b: *std.Build) void {
    // optimize for size
    const optimize = b.standardOptimizeOption(.{});

    const exe = b.addExecutable(.{
        .name = "init-exe",
        .root_source_file = .{ .path = "interopC.zig" },
        .optimize = optimize,
    });

    exe.addIncludePath(.{ .path = "c" });

    b.installArtifact(exe);
}
