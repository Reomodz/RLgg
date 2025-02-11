---@type ui
local ui = require('ui')

local layout = {
	'ui.ViewPager'
}

for i = 1, 10, 1 do
	layout[#layout + 1] = {
		Button,
		text = string.format('Page %s', i)
	}
end

local viewPager = luajava.loadlayout(layout)

local alert = luajava.newAlert()
alert:setView(viewPager)
gg.showAlert(alert)
