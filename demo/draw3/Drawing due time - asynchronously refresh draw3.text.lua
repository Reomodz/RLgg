local function drawExpireTime(time)
	local draw3 = require('draw3')

	local text1 = draw3.text('', 10, 100)
	text1.setColor('#ff0000')

	luajava.startThread(function()
		local time = time - os.time()

		while true do
			local D = time // (60 * 60 * 24)
			local H = time // (60 * 60) % 24
			local M = time // 60 % 60
			local S = time % 60

			local text
			if D > 0 then
				text = string.format('Expires in %d days %d hours %d minutes %d seconds', D, H, M, S)
			elseif H > 0 then
				text = string.format('Expires in %d hours %d minutes %d seconds', H, M, S)
			elseif M > 0 then
				text = string.format('Expires in %d minutes and %d seconds', M, S)
			elseif S > 0 then
				text = string.format('Expires in %d seconds', S)
			else
				local thread = luajava.startThread(function()
					gg.alert('Your membership has expired, please renew in time')
				end)

				-- Blocked for ten seconds
				luajava.threadJoin(thread, 1000 * 10)

				-- Exit the program instead of exiting the script with os.exit
				app.exit()
			end

			text1.update(text)
			time = time - 1
			gg.sleep(1000)
		end
	end)

end

-- Expires in 24 hours
-- drawExpireTime(os.time() + (60 * 60 * 24))

-- Expires in 70 seconds
-- drawExpireTime(os.time() + 70)

do
	if type(getrlyunyz) ~= 'function' then
		gg.alert('Please use RLGG to execute')
		os.exit()
		return
	end

	local info = {
	    example_version = '1.0.3',
		name = 'demo',
		appid = '10009',
		appkey = '4u33n332djlniFEF',
		rc4key = 'LgEXia1aAg810009',
		version = '1.0.3',
		mi_type = '3'
	}

	local rlyunyz = getrlyunyz(info)
	local ret = rlyunyz.start()
	if not ret or not isTable(ret) or ret.sign ~= 'e1d68b2eafaba91b16e15bb07c8faa41' then
		os.exit()
		return
	end

	drawExpireTime(ret.vip)
end

-- The above are all examples, none of them are important. What is important is to call drawExpireTime and pass in the expiration timestamp, which is a 10-digit number.


-- Mode Normal Script Blocking
while true do
end
