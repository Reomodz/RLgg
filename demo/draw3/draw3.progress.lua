draw3 = require('draw3')

local max = 100
local startX = 0
local startY = device.height / 2
local endX = device.width
local endY = startY + (startY / 10)

-- Create the drawn object
progress1 = draw3.progress(max, startX, startY, endX, endY)

for i = 1, max do
	progress1.update(i)
	gg.sleep(10)
end

