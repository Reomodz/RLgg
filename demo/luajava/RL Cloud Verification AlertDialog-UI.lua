do
	if type(getrlyunyz) ~= 'function' then
		gg.alert('Please use RLGG to execute')
		os.exit()
		return
	end

	local info = {
		name = 'demo',
		appid = '10009',
		appkey = '4u33n332djlniFEF',
		rc4key = 'LgEXia1aAg810009',
		version = '1.0.2',
		mi_type = '3'
	}

	local rlyunyz = getrlyunyz(info)

	local function login(rlyunyz)
		local result

		-- If it is automatic login, log in directly
		if rlyunyz.getAutoLogin() then
			return rlyunyz.start()
		end

		-- Verify if there is an update
		local ini = rlyunyz.checkUpdate()

		-- announcement
		local notice = rlyunyz.notice()

		-- Locks for synchronization
		local lock = luajava.getBlock()

		-- android.app.AlertDialog$Builder
		local alert = luajava.newAlert()
		luajava.post(function()
			-- android.app.AlertDialog
			alert = alert:create()
		end)

		-- Get the card code
		local function getkami()
			local name = 'RL Cloud Verification Card'
			local editText = luajava.getIdView(name)
			if not isUserdata(editText) then
				gg.alert(string.format('%s-control does not exist', name))
				return
			end
			return editText:getText()
		end

		-- Exit the pop-up window and end the blockage
		local function exit()
			alert:dismiss()
			lock('end')
		end

		-- Factory method to create and reuse GradientDrawable layout
		local function newGradientDrawableLayout(layout)
			local baseLayout = {
				GradientDrawable,
				cornerRadius = '15dp',
				color = 0x20000000
			}
			return table.copy(baseLayout, layout)
		end

		-- Factory method to create and reuse Button layout
		local function newButtonLayout(layout)
			local baseLayout = {
				Button,
				layout_width = 'match_parent',
				layout_margin = '5dp',
				textSize = '20sp',
				background = newGradientDrawableLayout()
			}

			return table.copy(baseLayout, layout)
		end

		-- The callback event cannot directly execute the blocking function, but needs to be executed by a thread
		local view = luajava.loadlayout({
			LinearLayout,
			orientation = 'vertical',
			background = newGradientDrawableLayout({color = 0xffff0000}), -- Theme Colors
			padding = {'10dp', '20dp', '10dp', '20dp'},
			{
				EditText,
				layout_width = 'match_parent',
				layout_margin = '5dp',
				hint = 'Please enter your card code',
				id = luajava.newId('RL Cloud Verification Card'),
				background = newGradientDrawableLayout()
			},
			{
				CheckBox,
				layout_width = 'match_parent',
				layout_margin = '5dp',
				text = 'Automatic Login',
				onCheckedChange = function(CompoundButton, state)
					rlyunyz.setAutoLogin(state)
				end
			},
			newButtonLayout({
				text = 'Log in',
				onClick = function()
					local function func()
						local km = getkami()
						local res = rlyunyz.login(km)
						if res then
							result = res
							exit()
						end
					end
					luajava.startThread(func)
				end
			}),
			newButtonLayout({
				text = 'Unbinding',
				onClick = function()
					local function func()
						local km = getkami()
						rlyunyz.unbind(km)
					end
					luajava.startThread(func)
				end
			})
		})
		alert:setView(view)

		-- Pop-up window canceled
		alert:setOnDismissListener(luajava.createProxy('android.content.DialogInterface$OnDismissListener', {
			onDismiss = function()
				exit()
			end
		}))

		-- Display pop-up windows asynchronously
		luajava.showAlert(alert)

		-- Blocked, waiting for the asynchronous pop-up window to end
		lock('join')

		return result
	end

	local ret = login(rlyunyz)
	if not ret or not isTable(ret) or ret.sign ~= 'e1d68b2eafaba91b16e15bb07c8faa41' then
		os.exit()
		return
	end
end
-- Just copy the above code to the beginning of your script

gg.alert('欢迎RLGG')

