const std = @import("std");

pub fn main() !void {
    std.debug.print("Hello, world!\n", .{});

    var buffer: [128]u8 = undefined;

    // spawn a process ping
    const result = try std.process.getCwd(buffer[0..]);

    std.debug.print("CWD: {s}\n", .{result});
}
