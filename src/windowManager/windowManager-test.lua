--[[


If you want to know the implementation source code of this module, please check the source code
https://gitee.com/rlyun/rlgg/blob/master/src/windowManager/windowManager.lua



Using the windowManager module to add a component (View) to a floating window only requires two steps

--1. Import the windowManager module
local windowManager = require('windowManager')

--2. Execute
windowManager:addView(your component)



Note: callback functions (such as onClick) cannot perform time-consuming tasks (such as the search function gg.searchNumber).
If this is required, please use multi-threaded execution, luajava.startThread(function() end)

--]]

local windowManager = require('windowManager')
local rootViewManager
local rootView

rootView = luajava.loadlayout({
	LinearLayout,
	layout_width = 'wrap_content',
	layout_height = 'wrap_content',
	padding = '20dp',
	orientation = 'vertical',
	backgroundColor = 0x40000000,
	{
		Button,
		text = 'Can be moved',
		onClick = function()
			rootViewManager:setMoveable(true)
		end
	},
	{
		Button,
		text = 'Movement Prohibition',
		onClick = function()
			rootViewManager:setMoveable(false)
		end
	},
	{
		Button,
		text = 'Hide for 3 seconds',
		onClick = function()
			rootViewManager:hide()

			luajava.startThread(function()
				local len = 3
				for i = 1, len do
					gg.toast(len - (i - 1))
					gg.sleep(1000)
				end
				rootViewManager:show()
			end)

		end
	},
	{
		Button,
		text = 'Exit floating window',
		onClick = function()
			rootViewManager:exit()
		end
	}
})


-- After binding the View, the default first parameter of the calling function is the View. If self is also calculated, the View is considered the second parameter.
rootViewManager = windowManager:bindView(rootView)

-- Equivalent to windowManager:addView(rootView)
rootViewManager:addView()

-- Setting can be moved
rootViewManager:setMoveable(true)

gg.setVisible(false)

-- Wait for the floating window to exit
rootViewManager:wait()
