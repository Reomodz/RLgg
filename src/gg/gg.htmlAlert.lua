-- This function is already built into RLGG gg.htmlAlert

local function htmlAlert(title, msg, ...)
	if isString(title) then
		title = string.fromHtml(title)
	end

	if isString(msg) then
		msg = string.fromHtml(msg)
	end

	local alert = gg.newAlert(title, msg)
	return gg.showAlert(alert, ...)
end

-- test

-- Both the title and the displayed content are in HTML text format
title = "<font color='#70f3ff'>title</font>"
message = "<font color='#FFFF00'>Test</font>"
gg.htmlAlert(title, message, "join in", "Cancel", "hesitate")
-- Five parameters
-- title, text, positive button, negative button, neutral button

-- Correct Usage
gg.htmlAlert(title, message, "Positive button", "Negative button", "Neutral button")
gg.htmlAlert(nil, message, "join in", "Cancel", "hesitate")
gg.htmlAlert(title, message)
gg.htmlAlert("hint：", "You are testing the script!")
gg.htmlAlert(nil, "Test")

html = gg.makeRequest("https://www.runoob.com/w3cnote/htmlcss-make-a-website.html").content

gg.htmlAlert(nil, html)
-- Except for the custom title at the beginning, the rest is the same as the original version.

-- Incorrect usage
-- gg.htmlAlert(message,"join in","Cancel","hesitate")
