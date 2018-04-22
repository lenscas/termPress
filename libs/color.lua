local Colors = {}
function Colors:init(str)
	local o = {}
	setmetatable(o,self)
	self.__index = self
	o.pieces = {str}
	o.str = str
	return o
end
function Colors:split(splitFun,applyFun)
	self.pieces = {}
	applyFun = applyFun or function(text) return text end
	local count = 0
	local pieceTable = {}
	for c in self.str do
		count = count + 1
		local res = fun(c,count)
		if res == 0 or res == 1 then
			pieceTable[#pieceTable] = char
		end
		if res == 1 or res==-1 then
			self.pieces[#self.pieces+1] = applyFun(
				colors:init(
					table.concat(
						pieceTable,
						""
					)
				),
				#self.pieces + 1
			)
		end
	end
	return self
end
function Colors:setColor(color,setEnd)
	setEnd = setEnd or setEnd==nil
	self.color = "\27[38;5;"..color.."m"
	if setEnd then
		print("yep?")
		self.endColor = "\27[39m" --sets it back to the default
	end
	return self
end
function Colors:setBackColor(color,setEnd)
	setEnd = setEnd or setEnd==nil
	self.background = "\27[48;5;"..color.."m"
	if setEnd then
		self.endBackground = "\27[49m"
	end
	return self
end
function Colors:setAmp(amp,toVal,setEnd)
	self.amps = self.amps or {}
	self.endAmps = self.endAmps or {}
	local setAt = amp
	if amp>2 then
		setAt = setAt-1
	end
	if amp >5 then
		setAt = setAt - 1
	end
	for i=1,setAt do
		self.amps[i] =self.amps[i] or ""
		self.endAmps[i] = self.endAmps or ""
	end
	if toVal then
		self.amps[setAt] = "\27["..amp.."m"
	else
		self.amps[setAt] = ""
	end
	setEnd = setEnd or setEnd==nil
	if setEnd then
		self.endAmps = self.endAmps or {}
		if toVal then
			--apparently bold needs to be turned off
			--by turning off dim. No idea why :(
			if amp == 1 then
				amp = 2
			end
			self.endAmps[setAt] = "\27[2"..amp.."myep"
		else
			self.endAmps[setAt] = ""
		end
	end
	return self
end
function Colors:write()
	local text = {
		self.background or "",
		self.color or "",
		table.concat(self.amps or {},""),
	}
	for k, v in ipairs(self.pieces) do
		if v.write then
			text[#text+1] = v:write()
		else
			text[#text+1] = v
		end
	end
	text[#text+1] = table.concat(self.endAmps or {},"")
	text[#text+1] = self.endColor or ""
	text[#text+1] = self.endBackground or ""
	for k,v in ipairs(text) do
		--print(k,v)
	end
	return table.concat(text)
end
return Colors
