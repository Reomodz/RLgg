-- This function is already built into RLGG gg.diyToast

local function diyToast(text, textColor, backgroundColor)
	text = tostring(text) -- Displayed text
	textColor = tonumber(textColor) -- The color value of the text
	backgroundColor = tonumber(backgroundColor) -- Background color value

	local TextView = TextView -- android.widget.TextView

	-- TextView Properties
	local layout = {
		TextView,
		text = text,
		textColor = textColor,
		backgroundColor = backgroundColor
	}

	-- The properties support more than these, please refer to the properties of android.view.View for details.

	return luajava.layoutToast(layout)
end

diyToast('null', 0xffff0000, nil)



-- Support covering the previous Toast
gg.diyToast('欢迎使用RLGG！', nil, nil)

