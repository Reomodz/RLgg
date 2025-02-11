--[[
Load a multi-page navigation component
luajava.getViewPagerMagicIndicator
The loaded layout supports 2 additional fields

getTitle Title text The return type must be string
getIconDrawable Title icon The returned type must be android.graphics.drawable.Drawable

https://gitee.com/rlyun/rlgg/blob/master/RLGG%E5%87%BD%E6%95%B0%E5%BA%93%E6%96%87%E6%A1%A3.md#luajavagetViewPagerMagicIndicator



]] --


local floatingWindowManager = require('floatingWindowManager')

floatingWindowManager:init()



local layouts = {
	[0] = nil,
	{
		LinearLayout,
		orientation = 'vertical',
		{
			Button,
			text = 'Function1',
			onClick = function()
				floatingWindowManager:start('Function1')
			end
		},
		{
			Button,
			text = 'Function2'
		},
		getTitle = function()
			return 'Function'
		end,
		getIconDrawable = function()
			return luajava.getDrawable('@android:drawable/ic_menu_home')
		end

	},
	{
		LinearLayout,
		orientation = 'vertical',
		{
			Button,
			text = 'Select Process',
			onClick = function()
				gg.setProcessX()
			end
		},
		{
			Button,
			text = 'Other settings'
		},
		getTitle = function()
			return 'set up'
		end,
		getIconDrawable = function()
			return luajava.getDrawable('@android:drawable/ic_menu_preferences')
		end

	},
	{
		LinearLayout,
		orientation = 'vertical',
		{
			Button,
			text = 'Join the discussion group',
			onClick = function()
				qq.joinGroup('694700750')
			end
		},
		{
			Button,
			text = 'Add me on QQ',
			onClick = function()
				qq.join('507522729')
			end
		},
		getTitle = function()
			return 'Discover'
		end,
		getIconDrawable = function()
			return luajava.getDrawable('@android:drawable/ic_menu_search')
		end
	},
	{
		LinearLayout,
		orientation = 'vertical',
		{
			TextView,
			text = 'No development',
		},
		getTitle = function()
			return 'I'
		end,
		getIconDrawable = function()
			return luajava.getDrawable('@android:drawable/ic_menu_invite')
		end

	}

}

local view = luajava.getViewPagerMagicIndicator(layouts)

local frameLayout = luajava.loadlayout({
	FrameLayout,
	layout_width = '200dp', -- A square component with a width and height of 200dp
	layout_height = '200dp',
	{view}
})


floatingWindowManager:newWindow('Bottom Navigation\nPage Layout', {
	onCreate = function(floatingWindow)
		floatingWindow:addView(frameLayout)
	end
})

floatingWindowManager:newWindow('Function1', {
	onCreate = function(floatingWindow)
		floatingWindow:addlayout({
			ScrollView,
			layout_width = 'match_parent',
			layout_height = 'match_parent',
			{
				LinearLayout,
				background = floatingWindowManager:getStateListDrawable(),
				layout_width = 'match_parent',
				layout_height = 'match_parent',
				orientation = 'vertical',
				padding = '4dp',
				{
					Button,
					background = floatingWindowManager:getStateListDrawable(),
					layout_width = 'match_parent',
					layout_margin = '5dp',
					text = 'Button1',
					textSize = '16sp',
				},
				{
					Button,
					background = floatingWindowManager:getStateListDrawable(),
					layout_width = 'match_parent',
					layout_margin = '5dp',
					text = 'Button2',
					textSize = '16sp',
				}
			}
		})

	end
})

-- Run floating window
floatingWindowManager:run()

