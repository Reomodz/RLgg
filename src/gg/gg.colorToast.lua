-- This function is already built into RLGG gg.colorToast

local function colorToast(html, length)
	return luajava.toast(string.fromHtml(html), length)
end

local res = gg.makeRequest('https://www.runoob.com/w3cnote/htmlcss-make-a-website.html')
local html = res.content or res

colorToast(html, 1)

