const std = @import("std");
const sharedData = @import("shared_extern.zig").sharedData;

var global_state: ?sharedData = null; 

pub export fn init() void {
    global_state = .{
        .t = 23,
        .flag = true,
    };
    return;
}

pub export fn get() *sharedData {
    return &global_state.?;
}
