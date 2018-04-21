local Shape = require"shape"
local Com   = Shape:extend()

function Com:extend(o)
	o = o or {}
	return setmetatable(o,{__index=self})
end

function Com:render(render)
	local term = self:getTerm()
	for y,line in ipairs(self.shape) do
		term.cursor.jump(self.y + (y - 1),self.x)
		for x,cell in ipairs(line) do
			if cell.text then
				local text = cell.text
				if self.color then
					text = term.colors[self.color](cell.text)
				end
				render:write(text)
			else
				term.cursor.goright(cell.jump)
			end
		end
	end
end
return Com
