const std = @import("std");

const sharedData = struct {
    t: u64,
    flag:bool,
};

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
