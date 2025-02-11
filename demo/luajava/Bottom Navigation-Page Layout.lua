--[[
Load a multi-page navigation component
luajava.getViewPagerMagicIndicator
The loaded layout supports 2 additional fields
getTitle Title text The return type must be string
getIconDrawable Title icon The return type must be android.graphics.drawable.Drawable

https://gitee.com/rlyun/rlgg/blob/master/RLGG%E5%87%BD%E6%95%B0%E5%BA%93%E6%96%87%E6%A1%A3.md#luajavagetViewPagerMagicIndicator


apk has an icon and meets the test requirements. All the following uses the installation package for demonstration

]]--

local list = app.runList()

local layouts = {}
for i, v in ipairs(list) do
	v = tostring(v) -- 包名
	if gg.isPackageInstalled(v) then

		layouts[#layouts + 1] = {
			LinearLayout,
			orientation = 'vertical',
			{
				LinearLayout,
				orientation = 'horizontal',
				{
					TextView,
					text = 'Package Name：'
				},
				{
					TextView,
					text = v
				}
			},
			{
				LinearLayout,
				orientation = 'horizontal',
				{
					TextView,
					text = 'View the installation path'
				},
				onClick = function()
					local path = app.getPath(v)
					if gg.alert2(v, path, 'copy') == 1 then
						gg.copyText(path, false)
					end
				end
			},
			getTitle = function()
				-- Get the application name
				return app.getName(v)
			end,
			getIconDrawable = function()
				local Drawable
				local ok, err = pcall(function()
					-- Get the app icon
					Drawable = app.getPackageInfo(v).applicationInfo:loadIcon(app.pm)
				end)
				return Drawable
			end
		}
	end

end

local view = luajava.getViewPagerMagicIndicator(layouts)

local frameLayout = luajava.loadlayout({
	FrameLayout,
	layout_width = '200dp', -- A square component with a width and height of 200dp
	layout_height = '200dp',
	{view}
})

local floatingWindowManager = require('floatingWindowManager')

floatingWindowManager:init()

floatingWindowManager:newWindow('Bottom Navigation\nPage Layout', {
	onCreate = function(floatingWindow)
		floatingWindow:addView(frameLayout)
	end
})

-- Run floating window
floatingWindowManager:run()

