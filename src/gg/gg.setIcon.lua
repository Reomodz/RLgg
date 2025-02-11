-- This function is already built into RLGG gg.setIcon  

local function setIcon(src)
	local Attr = {
		imageDrawable = luajava.getDrawable(src)
	}
	luajava.setFloatingWindowAttr(Attr)
end



gg.setIcon('https://q4.qlogo.cn/headimg_dl?dst_uin=507522729&spec=640')

