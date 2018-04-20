package.path  = package.path .. ";./libs/?.lua;./classes/?.lua;./classes/shapes/?.lua";
local render  = require"render"
local Square  = require"square"
local Command = require"command"
local screen  = require"screen"
local input   = require"input"
input:registerStr("",function()return true end)
while true do
	render:removeAll()
	local atScreen = screen.newScreen()
	if not atScreen then
		break
	end
	atScreen:start{
		shapes = {
			Square  = Square,
			Command = Command
		},
		input = input,
		render = render
	}
	if not atScreen then
		break
	end
	repeat render:draw() until(input:checkEvents())
end
local atScreen = screen.newScreen()
screen.clear()
