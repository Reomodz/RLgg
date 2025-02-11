--[[

gg.setIcon
https://gitee.com/rlyun/rlgg/blob/master/RLGG%E5%87%BD%E6%95%B0%E5%BA%93%E6%96%87%E6%A1%A3.md#ggseticon

]]

-- Set the RLGG floating window to the icon of the currently selected application
do
	local Attr = {
		imageDrawable = app.loadIcon(gg.getTargetPackage())
	}
	luajava.setFloatingWindowAttr(Attr)
end
