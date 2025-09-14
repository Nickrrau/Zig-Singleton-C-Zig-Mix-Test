const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});
    const shared_lib = b.addObject(.{
        .name = "shared",
        .root_module = b.createModule(.{
            .root_source_file = b.path("src/shared.zig"),
            .target = target,
            .optimize = optimize,
        }),
    });

    const baz_obj = b.addObject(.{
        .name = "baz",
        .root_module = b.createModule(.{
            .root_source_file = b.path("src/baz.zig"),
            .target = target,
            .optimize = optimize,
            .link_libc = true,
        }),
    });

    const main = b.createModule(.{
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
        .link_libc = true,
    });

    const exe = b.addExecutable(.{
        .name = "out",
        .root_module = main,
        .link_libc = true,
    });
    // exe.linkLibrary(shared_lib);
    exe.addIncludePath(b.path("src/"));
    exe.addCSourceFile(.{ .file = b.path("src/foo.c") });
    exe.addObject(baz_obj);
    exe.addObject(shared_lib);
    b.installArtifact(exe);

    const run_cmd = b.addRunArtifact(exe);
    run_cmd.step.dependOn(b.getInstallStep());
    if (b.args) |args| {
        run_cmd.addArgs(args);
    }
    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&run_cmd.step);
}
