local Text = require"text"
local Command = Text:extend()
function Command:new(o)
	o = o or {}
	setmetatable(o,self)
	self.__index = self
	local fileHandler = io.popen(o.com or o.command)
	local text = fileHandler:read("*a")
	text = "\n" ..text
	self:textToShape(text)
	return o
end
return Command
