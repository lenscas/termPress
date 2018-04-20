local posix = require"posix"
local events = {}

return {
	checkEvents = function()
		local str = io.read()
		print(#str,str)
		if events[str] then
			return events[str]
		end
	end,
	registerStr = function(self,str,fun)
		events[str] = fun
	end,
	removeStr = function(self,str)
		events[str] = nil
	end,
	removeAllStrs = function()
		events = {}
	end
}
