local Shape = require"shape"
local Square = Shape:extend()
function Square:new(o)
	o = o or {}
	setmetatable(o,self)
	self.__index = self
	return o
end
function Square:render(render)
	local term = self.getTerm()
	local line = {}
	for i = 1, self.sizeX do
		line[#line+1] = self.char
	end
	line = table.concat(line,"")
	if self.color then
		line = term.colors[self.color](line)
	end
	for j = self.y,(self.y +  self.sizeY) do
		term.cursor.jump(j,self.x)
		render:write(line)
	end
end
return Square
