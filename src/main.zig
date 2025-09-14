const std = @import("std");
const c = @cImport(
    @cInclude("foo.h")
);
extern fn get() *struct{t:u64};
extern fn init() void;

pub fn main() !void {
    std.debug.print("Starting init\n", .{});
    init();
    const t = get();
    std.debug.print("Shared Value: {?}\n", .{t.t});
    std.debug.print("Ptr: {?}\n", .{@intFromPtr(t)});
    std.debug.print("Calling external c Code\n", .{});
    c.foo();
}

