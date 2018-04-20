screen = {}

function screen:start(apis)
	print(apis)
	local square = apis.shapes.Square:new{
		x = 10,
		y = 10,
		color = "red",
		sizeY = 12,
		char = "-",
		sizeX = 10
	}
	apis.render:addShape(square)

end
return screen
