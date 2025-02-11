
---@type ui
local ui = require('ui')

---@type windowManager
local windowManager = require('windowManager')


do
	local path = file.getCacheName('9b78f722.gif')
	-- Determine whether there is a cache file by using file MD5
	if not file.md5(path, '0fe37fb6ef265d527ba8ed9280efab27') then
		assert(downloadLanzou('https://lanzoux.com/iadwQ1io64ba', {
			passwd = 'a8go'
		}, path))
	else
		-- print('cached')
	end
	
	-- GifImageView:android.widget.ImageView
	local gifImageView = luajava.loadlayout({
		'ui.GifImageView',
		src = path,
	})
	
	local viewManager=windowManager:bindView(gifImageView)
	viewManager:setMoveable(true)
	viewManager:show()
	viewManager:park()
end
