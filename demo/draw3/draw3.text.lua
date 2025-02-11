draw3 = require('draw3')
text1 = draw3.text('0', device.width / 2, device.height / 2)
for i = 1, 100 do
	gg.sleep(50)

	-- Set random color
	local color = math.random(000000, 0xffffff)
	text1.setColor(color)

	-- Update text
	text1.update(i)
end
