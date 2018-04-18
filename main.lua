package.path = package.path .. ";./libs/?.lua;./classes/?.lua;./classes/shapes/?.lua";
local render = require"render"
local Square = require"square"
render:addShape(Square:new{
	z = 3,
	x = 2,
	y = 1,
	sizeX = 3,
	sizeY = 6,
	char = "+",
	color = "red"
})
render:addShape(Square:new{
	z = 2,
	x = 1,
	y = 1,
	sizeX = 10,
	sizeY = 4,
	char  = "-",
	color = "blue"
})
--render:debug()
--os.exit()
render:draw()
local term = require"term"
local colors = {}
for k,v in pairs(term.colors) do
	colors[#colors+1] = k
end
print(#colors)
local function newSquare()
	return {
		z = math.random(0,1000),
		x = math.random(0,50),
		y = math.random(0,50),
		sizeX = math.random(0,50),
		sizeY = math.random(0,50),
		char  = "+",
		color = colors[math.random(1,#colors)]
	}

end
while true do
	os.execute("clear")
	for i=1,20 do
		render:addShape(Square:new(newSquare()))
	end
	render:draw()
	print("go")
	io.read()
end
