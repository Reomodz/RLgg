local alert = luajava.newAlert()

local view = luajava.loadlayout({
	SeekBar,
	layout_width = 'match_parent',
	min = 0,
	max = 1024,
	onSeekBarChange = {
		onProgressChanged = function(SeekBar, var2, var3)
			if not var3 then
				return
			end

			gg.toast(tostring(var2))
		end
	}
})
alert:setView(view)
gg.showAlert(alert)
