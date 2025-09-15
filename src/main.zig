const std = @import("std");
const c = @cImport(
    @cInclude("foo.h")
);
const shared = @import("shared_extern.zig");

pub fn main() !void {
    std.debug.print("Starting init\n", .{});
    shared.init();
    const t = shared.get();
    std.debug.print("Shared Value: {?}\n", .{t.t});
    std.debug.print("Ptr: {?}\n", .{@intFromPtr(t)});
    std.debug.print("Calling external c Code\n", .{});
    c.foo();
}

