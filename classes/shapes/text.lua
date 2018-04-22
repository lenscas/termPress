local Complex = require"complex"
local Text = Complex:extend()
function Text:new(o)
	o = o or {}
	setmetatable(o,self)
	self.__index = self
	o.text = "\n" ..o.text
	self:textToShape(o.text)
	return o
end
function Text:extend(o)
	o = o or {}
	setmetatable(o,self)
	self.__index = self
	return o
end
function Text:textToShape(text)
	self.shape = {}
	for i = 1,#text do
		local char = text:sub(i,i)
		if char == "\n" then
			self.shape[#self.shape + 1] = {}
		else
			if not self.shape[#self.shape] then
				self.shape[#self.shape] = {}
			end
			local line = self.shape[#self.shape] or {}
			if not line[#line] then
				line[#line] = {}
			end
			local curPlace = line[#line] or {}
			if char == " " and self.transparent then
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
return Text
