-- Imitating auto.js, the instructions can be viewed at the address on the right: https://hyb1996.github.io/AutoJs-Docs/#/coordinatesBasedAutomation

local width = device.width
local height = device.height

local x1 = width / 4
local y1 = height / 4

local x2 = x1 * 2
local y2 = y1 * 2

local tests = {
	['Simulate click coordinates(x, y)'] = function()
		auto.click(x1, y1)
	end,
	['Simulate long press coordinates(x, y)'] = function()
		auto.longClick(x1, y1)
	end,
	['Simulate pressing and holding coordinates(x, y)'] = function()
		auto.press(x1, y1, 1000)
	end,
	['Simulate sliding from coordinate (x1, y1) to coordinate(x2, y2)'] = function()
		auto.swipe(x1, y1, x2, y2, 1000)
	end,
	['Simulate gesture operation'] = function()
		auto.gesture(500, {x1, y1}, {x2, y1}, {x2, y2}, {x1, y2}, {x1, y1})
	end,
	['Simulate multiple gestures simultaneously'] = function()
		local arr = {}
		for i = 1, 10 do
			local py = (i - 1) * x1 / 10
			local arr2 = {0, 500, {x1, y1}, {x2, y1}, {x2, y2}, {x1, y2}, {x1, y1}}
			for i = 3, #arr2 do
				local value = arr2[i]
				value[1] = value[1] + py
				value[2] = value[2] + py
			end
			arr[i] = arr2
		end

		auto.gestures(table.unpack(arr))
	end
}

local arr = {}
for k, v in pairs(tests) do
	arr[#arr + 1] = k
end
arr[#arr + 1] = 'quit'

local function main()
	local input = gg.choices(arr, nil, 'auto')
	if input == #arr then
		os.exit()
	else
		local name = arr[input]
		local func = tests[name]
		gg.setVisible(false)
		gg.sleep(1000)
		func()
	end
end

while true do
	if gg.isVisible() then
		main()
		gg.setVisible(false)
	end
	gg.sleep(100)
end

