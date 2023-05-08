const print = @import("std").debug.print;

pub fn main() !void {
    print("Hello {s}!\n", .{"world"});

    // Strings and string-like things
    const real: *const [3:0]u8 = "baz"; // pointer to null-terminated array
    const a: []const u8 = "foo"; // slice (pointer with length)
    const b: [*]const u8 = "bar"; // many-item pointer (unknown length!)
    const b2: []const u8 = b[0..3]; // ...cast to slice so it has a length
    const c = [3]u8{ 'f', 'o', 'o' }; // array
    const d = [_]u8{ 'b', 'a', 'r' }; // array with inferred size
    const e: [3]u8 = .{ 'b', 'a', 'z' }; // array from anonymous struct
    print("{s} {s} {s} {s} {s} {s}\n", .{ real, a, b2, c, d, e });

    // Errors
    const ESet = error{ Bad, Worse }; // error set
    const darkness = error.DarknessAndDespair; // a single error
    var maybe_error: ESet!u8 = ESet.Bad; // error union: error OR a u8
    var not_error: u8 = maybe_error catch 0; // catch error and replace with default
    print("not_error (default value): {}\n", .{not_error});
    maybe_error = 4; // not an error, or program will panic/halt for the following
    var definitely_not_error: u8 = maybe_error catch unreachable;
    var not_error_or_death: u8 = maybe_error catch |err| return err;
    var not_error_or_death2: u8 = try maybe_error; // shorthand for catch/return
    if (maybe_error) |good_value| { // capture non-error value
        print("maybe_error is NOT an error: {}\n", .{good_value});
    } else |err| switch (err) { // capture error value, switch on type
        ESet.Bad => {}, // handle bad error
        ESet.Worse => {}, // handle worse error
    }
    errdefer print("This would print if main() returned with error.\n");

    // Optionals
    var maybe_null: ?u8 = null; // basically a "null union"
    if (maybe_null) print("it is null!", .{});
    var not_null: u8 = maybe_null orelse 4; // replace null with default value
    print("not_null (default value): {}\n", .{not_null});
    maybe_null = 5; // set to not null
    var better_not_be_null = maybe_null.?; // short for "maybe_null orelse unreachable"
    if (maybe_null) |never_null| {
        print("Capturing non-null value never_null: {}\n", .{never_null});
    } else {
        print("Was null\n", .{});
    }

    // .... to be continued ....
}
