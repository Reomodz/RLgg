-- Create an su process with root privileges
local su = newShell(true)

local err = su.su()
if err:find('%S') then
	error(err)
end


local format = string.format

local function tap(x, y)
	return su.cmd(format('input tap %s %s', x, y))
end

local function swipe(startX, startY, endX, endY)
	return su.cmd(format('input swipe %s %s %s %s', startX, startY, endX, endY))
end

gg.setVisible(false)
gg.sleep(200)


local x = device.x
local y = device.y / 2

swipe(0, y, x, y, 500) -- Swipe the screen from left to right
gg.sleep(1000)
-- No need to apply for root permissions repeatedly
swipe(0, y, x, y, 500) -- Swipe the screen from left to right