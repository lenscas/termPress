local Shape = require"shape"
local Com   = Shape:extend()

function Com:extend(i)
	o = o or {}

	return setmetatable(o,{__index=self})
end

function Com:render()
	local term = self:getTerm()
	for y,line in ipairs(self.shape) do
		term.cursor.jump(self.y + (y - 1),self.x)
		for x,cell in ipairs(line) do
			if cell.text then
				io.write(cell.text)
			else
				term.cursor.goright(cell.jump)
			end
		end
	end
end
return Com
