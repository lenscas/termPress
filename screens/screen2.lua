screen = {}

function screen:start(apis)
	print(apis)
	local square = apis.shapes.Square:new{
		x = 0,
		y = 20,
		color = "blue",
		sizeY = 12,
		char = "-",
		sizeX = 10
	}
	apis.render:addShape(square)

end
return screen
