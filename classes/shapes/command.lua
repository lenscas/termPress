local Complex = require"complex"
local Command = Complex:extend()
function Command:new(o)
	o = o or {}
	setmetatable(o,self)
	self.__index = self
	local fileHandler = io.popen(o.com or o.command)
	local text = fileHandler:read("*a")
	text = "\n" ..text
	o.shape = {}
	for i = 1,#text do
		local char = text:sub(i,i)
		if char == "\n" then
			o.shape[#o.shape + 1] = {}
		else
			if not o.shape[#o.shape] then
				o.shape[#o.shape] = {}
			end
			local line = o.shape[#o.shape] or {}
			if not line[#line] then
				line[#line] = {}
			end
			local curPlace = line[#line] or {}
			if char == " " and o.transparent then
				if curPlace.jump then
					curPlace.jump = curPlace.jump + 1
				else
					line[#line + 1] = {jump = 1}
				end
			else
				if curPlace.text then
					curPlace.text = curPlace.text .. char
				else
					line[#line + 1] = {text=char}
				end
			end
		end
	end
	return o
end
return Command
