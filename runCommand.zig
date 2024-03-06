const std = @import("std");

const Child = std.process.Child;
const ArrayList = std.ArrayList;

pub fn main() !void {
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    const allocator = arena.allocator();

    const argv = [_][]const u8{
        "ls",
        "-la",
    };

    var child = Child.init(&argv, allocator);

    child.stdout_behavior = .Pipe;
    child.stderr_behavior = .Pipe;

    var stdout = ArrayList(u8).init(allocator);
    var stderr = ArrayList(u8).init(allocator);

    defer {
        stdout.deinit();
        stderr.deinit();
    }

    try child.spawn();
    try child.collectOutput(&stdout, &stderr, 1024);

    std.debug.print("stdout: {s}\nstderr: {s}\n", .{ stdout.items, stderr.items });
}
