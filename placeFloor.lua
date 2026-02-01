--[[ WIP
Program by Hunter Bays.
wget "https://raw.githubusercontent.com/Bays246/Computer-Craft-Programs/refs/heads/main/placeFloor.lua" placeFloor.lua

Places a floor of specified size.
"left"      "right"
xxxxxx      xxxxxxx
xxxxxx      xxxxxxx     +        up+
xxxxxx      xxxxxxx     x   +Y-   z
xxxxxx  or  xxxxxxx     -        dn-
xxxxxx      xxxxxxx
     c      c

The turtle expects to start at "c" in the pattern,
(from the bottom corner) and expects to be facing
the area intending to be cleared (twards +x).

Called as such:
placeFloor length width height
placeFloor length width height 'fill'
placeFloor length width height 'left/right'
placeFloor length width height 'left/right' 'fill'
placeFloor 'template'

Defaults to clearing to the left.

If there is a floor already the turtle will check if it
is made of the blocks given, and if it is not, replace
the current floor.

Expects items to be in the first inventory slots.
]]

-- Variables --
local tArgs = { ... } -- Input arguments.
local length, width, height -- User defined numbers.
local left = true -- User defined boolean, defaults to true for left.
local relativeX, relativeY, relativeZ = 0, 0, 0 -- Relative to starting location "c."

-- Input Parsing --
-- Must be executed on a turtle.
if not turtle then
    printError("Requires a Turtle")
    return
end

-- Special case, example template.
if (#tArgs == 1) and (tArgs[1] == "template") then
    print("Printing 'right' example template.")
    print("xxxxxxx")
    print("xxxxxxx")
    print("xxxxxxx")
    print("xxxxxxx")
    print("xxxxxxx")
    print("c")
    return
end

-- Check number of arguments.
if not ((#tArgs == 3) or (#tArgs == 4)) then
    print("Usage:")
    print("placeFloor <length> <width> <height>")
    print("placeFloor <l> <w> <h> 'left/right'")
    print("placeFloor 'template'")
    return
end

-- Check number arguments.
length = tonumber(tArgs[1])
width = tonumber(tArgs[2])
height = tonumber(tArgs[3])
if (length == nil or width == nil or height == nil) then
    print("For the first 3 arguments...")
    print("Positive whole numbers expected. (e1)")
    return
end
if (length < 1 or width < 1 or height < 1) then
    print("For the first 3 arguments...")
    print("Positive whole numbers expected. (e2)")
    return
end
if (length % 1 > 0 or width % 1 > 0 or height % 1 > 0) then
    print("For the first 3 arguments...")
    print("Positive whole numbers expected. (e3)")
    return
end
--[[
Wanted to use math.modf(x,y) because I feel
that would be more efficient but dunno how
to only use the second argument and throw it
all away on the same line.
]]

-- Check left/right argument (defaults left).
if tArgs[4] then
    if tArgs[4] == "right" then
        left = false
    elseif tArgs[4] == "left" then
        left = true -- This line not strictly necessary (default defined earlier).
    else
        print("For the fourth argument...")
        print("\"Left\" or \"Right\" expected.")
        print("(No quotes needed).")
        return
    end
end

-- Functions --
