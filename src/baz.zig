const std = @import("std");

extern fn get() *struct{t:u64};

pub export fn baz() void {
    const t = get();
    std.debug.print("Shared Value: {?}\n", .{t.t});
    std.debug.print("Ptr: {?}\n", .{@intFromPtr(t)});
}
