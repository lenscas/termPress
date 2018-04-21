local Shape = require"shape"

local Back = Shape:extend()

function Back:new(o)
	o = o or {}
	setmetatable(o,self)
	self.__index = self
	return o
end
function Back:makeScreenFill()
	local p = io.popen('stty size')
	local sizeY = p:read("*number")+10
	local sizeX = p:read("*number")
	p:close()
	local backgroundLineTable = {}
	for i=1,sizeX do
		table.insert(backgroundLineTable," ")
	end
	table.insert(backgroundLineTable,"\n")
	local backgroundLine = table.concat(backgroundLineTable,"")
	local backgroundTable = {}
	for i=1,sizeY do
		table.insert(backgroundTable,backgroundLine)
	end
	self.screenFill = table.concat(backgroundTable)

end

function Back:render(render)
	if not self.screenFill then
		self:makeScreenFill()
	end
	local term = self:getTerm()
	io.write(term.colors["on"..self.color](self.screenFill))
	render:setBackgroundColor(self.color)
end
return Back
