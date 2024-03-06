const std = @import("std");
const fs = std.fs;

pub fn main() !void {
    const cwd = fs.cwd();
    try cwd.makeDir("My Directory");

    // create a file inside the directory

    const file = try cwd.createFile("My Directory/My File.txt", .{ .read = true });

    try file.writeAll("Hello, world!\n");

    file.close();
}
