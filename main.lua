package.path = package.path .. ";./libs/?.lua;./classes/?.lua;./classes/shapes/?.lua";
local render = require"render"
local Square = require"square"
local Command = require"command"

local red = render:addShape(Square:new{
	z = 5,
	x = 7,
	y = 1,
	sizeX = 20,
	sizeY = 20,
	char = "+",
	color = "red"
})
local blue = render:addShape(Square:new{
	z = 2 ,
	x = 1,
	y = 1,
	sizeX = 20,
	sizeY = 4,
	char  = "-",
	color = "blue"
})

local com =render:addShape(Command:new{
	z = 3,
	y = 2,
	x = 4,
	transparent = true,
	command = 'echo "awesome" |toilet --gay -w 20'

})
render:draw()
io.read()
render:removeAll()
render:removeShape(blue)
render:draw()
io.read()
render:removeShape(com)
render:draw()
io.read()
render:removeShape(red)
render:draw()
render:removeAll()
