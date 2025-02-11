-- This function is already built into RLGG gg.image

local function image(src, msg)
	local layout = {
		ScrollView, -- android.widget.ScrollView
		padding = '4dp',
		{
			ImageView, -- android.widget.ImageView
			src = src -- src can be a cloud resource or a local file
		}
	}

	local alert = gg.newAlert(nil, msg)
	local view = luajava.loadlayout(layout)
	alert:setView(view)

	-- Using gg.showAlert will block the same as gg.alert
	return gg.showAlert(alert)
end

gg.image('https://i0.hdslb.com/bfs/article/73e6e9c0e8672ec87fddc268c4d836dcd1562768.jpg@942w_1331h_progressive.webp')
