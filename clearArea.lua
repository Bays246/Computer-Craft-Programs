--[[  WIP
Program by Hunter Bays.
https://raw.githubusercontent.com/Bays246/Computer-Craft-Programs/refs/heads/main/clearArea.lua

Clears an area using the pattern below.
"left"      "right"
xoooox      xooooxxooooxx
xoxxox      xoxxoxxoxxoxx     +        up+
xoxxox      xoxxoxxoxxoxx     x   +Y-   z
xoxxox  or  xoxxoxxoxxoxx     -        dn-
ooxxox      xoxxooooxxooo
    ^c      c^

The turtle expects to start at "c" in the pattern,
(from the bottom corner) and expects to be facing
the area intending to be cleared (twards +x).

Starting the path from "^" seems to
be more efficient on avg than from "c."

Called as such:
clearArea length width height
clearArea length width height 'left/right'
clearArea 'template'

Defaults to clearing to the left.
]]

-- Variables --
local tArgs = { ... } -- Input arguments.
local length, width, height -- User defined numbers.
local left = true -- User defined boolean, defaults to true for left.
local relativeX, relativeY, relativeZ = 0, 0, 0 -- Relative to starting location "c."
local chestPresent = false -- Is there a chest adjacent to the the "c" position?

-- Input Parsing --
-- Must be executed on a turtle.
if not turtle then
    printError("Requires a Turtle")
    return
end

-- Special case, example template.
if (#tArgs == 1) and (tArgs[1] == "template") then
    print("Printing 'right' example template.")
    print("xooooxxooooxx")
    print("xoxxoxxoxxoxx")
    print("xoxxoxxoxxoxx")
    print("xoxxoxxoxxoxx")
    print("xoxxooooxxooo")
    print("c^")
    return
end

-- Check number of arguments.
if not ((#tArgs == 3) or (#tArgs == 4)) then
    print("Usage:")
    print("clearArea <length> <width> <height>")
    print("clearArea <l> <w> <h> 'left/right'")
    print("clearArea 'template'")
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
-- When inventory is full deposit items to a chest, if applicable.
function depositItems()
    -- No point if no chest.
    if chestPresent == false then return false end
    
end
-- Try mine the block to the right of the turtle then return to original orientation.
function mineRightBlock()
    
end
-- Try mine the block to the left of the turtle then return to original orientation.
function mineLeftBlock()
    
end
-- 
function mineSides()
    
end
-- 
function elevate()
    
end
-- 
function descend()
    
end
-- 
function xStep()
    
end
-- 
function yStep()
    
end

-- Main --
-- Check for a chest to store items.

-- Get into position.
if left then 
    
else
    
end

--[==[
ToDo:
Mining with a full inventory drops blocks.
Gunna ignore unbreakable blocks for now.
Y value decides tunnel and x direction (x++ or x--).
]==]

--[====[ debug
print("tArgs")
print(tArgs)
print("length")
print(length)
print("width")
print(width)
print("height")
print(height)
print("left")
print(left)
print("relativeX")
print(relativeX)
print("relativeY")
print(relativeY)
]====]