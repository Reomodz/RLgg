local alert = gg.newAlert('Round Corners')

local view = luajava.loadlayout({
	Button,
	text = 'Button',
	background = {
		GradientDrawable,
		cornerRadius = '15dp',
		color = 0xffff0000
	}
})
alert:setView(view)

gg.showAlert(alert)
