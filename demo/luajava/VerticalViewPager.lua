---@type ui
local ui = require('ui')

local layout = {
	'ui.VerticalViewPager'
}

for i = 1, 10, 1 do
	layout[#layout + 1] = {
		Button,
		text = string.format('Page %s', i)
	}
end

local verticalViewPager = ui.VerticalViewPager(layout)

local alert = luajava.newAlert()
alert:setView(verticalViewPager)
gg.showAlert(alert)
