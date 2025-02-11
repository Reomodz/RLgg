-- Factory method to create and reuse GradientDrawable layout
local function newGradientDrawableLayout(layout)
	local baseLayout = {
		GradientDrawable,
		cornerRadius = '15dp',
		color = 0x20000000
	}
	return table.copy(baseLayout, layout)
end

local function getVideoView(videoPath)
	local layout = {
		VideoView,
		videoPath = videoPath
	}

	local video = luajava.post(luajava.loadlayout, layout)
	return video
end


-- Cache URL file locally (this is a video I found randomly on Baidu)
local videoPath, err = file.checkUrl('https://baikevideo.cdn.bcebos.com/media/mda-OgieEXY16SVdPBHF/5f63fbe58e4350ac586d4d9c0b20f721.mp4')
if not videoPath then
	error(err)
end

-- Get the playback component of the video file
local video = getVideoView(videoPath)

local rootView = luajava.loadlayout({
	LinearLayout,
	orientation = 'vertical',
	background = newGradientDrawableLayout({color=0xffff0000}),
	padding = {'10dp', '20dp', '10dp', '20dp'},
	{
		video
	},
	{
		LinearLayout,
		layout_width = 'match_parent',
		padding = '4dp',
		background = newGradientDrawableLayout(),
		{
			Button,
			layout_weight = 1,
			layout_width = '0dp',
			text = 'Play Video',
			background = newGradientDrawableLayout({color=0x00000000}),
			onClick = function()
				video:start()
			end
		},
		{
			Button,
			layout_weight = 1,
			layout_width = '0dp',
			text = 'Pause playback',
			background = newGradientDrawableLayout({color=0x10000000}),
			onClick = function()
				video:pause()
			end
		}
	}

})

local alert = luajava.newAlert()
alert:setView(rootView)

-- Will block, there is a confirmation button
-- gg.showAlert(alert)

-- Will not block, no confirmation button
luajava.showAlert(alert)

-- Play video
video:start()

-- Hide GG interface
gg.setVisible(false)