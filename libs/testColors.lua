local colors = require"color"
local text = "some text"
local coloredText = colors:init(text):setColor(1):setBackColor(2):setAmp(1,true):split(
	function(char)
		if char==" " then
			return 1
		else
			return 0
		end
	end,
	function(color,count)
		if count==2 then
			color:setColor(2):setBackColor(3)
		end
		return color
	end
)
for k,v in pairs(coloredText) do
	--print(k,v)
end
print(coloredText)
print(coloredText:write(),"here should be the text")
print([[


some
extra
text
]])
os.execute('echo -e "Default \\e[49mDefault"')
os.execute('echo -e "Default \\e[39mDefault"')
os.execute('echo -e "Normal \\e[1mBold \\e[22mNormal"')
