package.path  = package.path .. ";./libs/?.lua;./classes/?.lua;./classes/shapes/?.lua";
local render     = require"render"
local Square     = require"square"
local Command    = require"command"
local Background = require"background"
local screen     = require"screen"
local input      = require"input"
local specialChars = require"specialChars"
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
			Command = Command,
			Background = Background
		},
		chars = specialChars,
		input = input,
		render = render
	}
	if not atScreen then
		print("wtf?")
		break
	end
	--io.read()
	repeat render:draw() until(input:checkEvents())
end
screen.clear()
