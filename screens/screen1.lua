screen = {}

function screen:start(apis)
	print(apis)
	local background = apis.shapes.Background:new{
		z = 10,
		color = "black",
	}
	apis.render:addShape(background)
	local title = apis.shapes.Command:new{
		z = 9,
		x = 50,
		y = 5,
		transparent = true,
		color = "green",
		command = "echo Inleiding | toilet",

	}
	local text = apis.shapes.Text:new{
		z = 9,
		x = 50,
		y = 15,
		transparent = true,
		color = "green",
		text =
[[
* punt 1
* punt 2
* punt 3
]]
	}
	apis.render:addShape(title)
	apis.render:addShape(text)

end
return screen
