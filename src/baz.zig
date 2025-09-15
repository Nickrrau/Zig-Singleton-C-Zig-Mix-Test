const std = @import("std");
const shared = @import("shared_extern.zig");

pub export fn baz() void {
    const t = shared.get();
    std.debug.print("Shared Value: {?}\n", .{t.t});
    std.debug.print("Ptr: {?}\n", .{@intFromPtr(t)});
}
