const std = @import("std");
const RndGen = std.rand.DefaultPrng;

export fn testSort() void {
    const length = 100_000;

    // create array with 32 bit random numbers
    var rnd = RndGen.init(0);
    var arr: [length]u32 = undefined;
    var i: u32 = 0;
    while (i < arr.len) : (i += 1) {
        arr[i] = rnd.random().int(u32);
    }

    // copy 500 numbers from array into temp array and sort them
    var temp: [length]u32 = undefined;
    i = 0;
    while (i < 500) : (i += 1) {
        temp[i] = arr[i];
    }
    std.sort.sort(u32, &temp, {}, comptime std.sort.asc(u32));
}
