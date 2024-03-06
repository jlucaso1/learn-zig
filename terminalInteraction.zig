const std = @import("std");

pub fn main() !void {
    const stdin = std.io.getStdIn().reader();

    var buffer: [16]u8 = undefined;

    while (true) {
        const bytesRead = try stdin.read(buffer[0..]);

        // std.debug.print("Read {s} bytes\n", .{buffer[0..bytesRead]});

        // check if exit is typed
        if (std.mem.eql(u8, buffer[0..bytesRead], "exit\n")) {
            break;
        }

        _ = try std.io.getStdOut().write(buffer[0..bytesRead]);
    }

    std.debug.print("Exiting\n {s}", .{buffer});
}
