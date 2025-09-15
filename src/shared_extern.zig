
pub const sharedData = struct {
    t: u64,
    flag:bool,
};

pub extern fn get() *sharedData;
pub extern fn init() void;
