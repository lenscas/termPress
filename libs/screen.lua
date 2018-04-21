local debug = true
local screens = {}
local count = 1
repeat
	local succ, screen = pcall(
		function()
			return dofile("./screens/screen"..count..".lua")
		end
	)
	if debug and not succ then
		print(screen)
	end
	if succ then
		if not screen then
			error("didn't return anything")
		end
		screens[#screens+1] = screen
	end
	count = count + 1
until(not succ)
local atScreenFilePath = "./conf/screen"
local atScreenFile= assert(io.open(atScreenFilePath))
local function writeNewScreenNumber(num)
	local f = assert(io.open(atScreenFilePath,"w"))
	f:write(num)
	f:close()
end
local atScreen = tonumber(atScreenFile:read()) or 1
atScreenFile:close()

local curScreen = nil
return {
	newScreen = function()
		if curScreen and curScreen.shutdown then
			curScreen:shutdown()
		end
		if screens[atScreen] then
			writeNewScreenNumber(atScreen)
			curScreen = screens[atScreen]
			atScreen  = atScreen + 1
			return curScreen
		end
		return false
	end,
	clear = function()
		writeNewScreenNumber(1)
	end
}
