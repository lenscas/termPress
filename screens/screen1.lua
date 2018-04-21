screen = {}

function screen:start(apis)
	print(apis)
	local background = apis.shapes.Background:new{
		z = 10,
		color = "black",
	}
	apis.render:addShape(background)
	local text = apis.shapes.Command:new{
		z = 9,
		x = 50,
		y = 5,
		transparent = true,
		color = "green",
		command = "echo Inleiding | toilet",

	}
	apis.render:addShape(text)

end
return screen
