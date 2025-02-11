local function assertFunc(func)
	return assert(func, 'This function is not supported')
end

local function getRootExecCallback(func)
	return function(...)
		local args = table.pack(...)
		local func = assertFunc(func)
		local n = args.n + 1
		args[n] = true
		return func(table.unpack(args, 1, n))
	end
end

-- A closure with only one static parameter
local function staticArgClosure1(func, p1)
	return function()
		local func = assertFunc(func)
		return func(p1)
	end
end

local function getFunctionMap()
	local map = {
		['Select process'] = checkPkg,
		['Execute command'] = getRootExecCallback(string.exec),
		['Convert text'] = tostring,
		['Import'] = import,
		['Load module'] = require,
		['Disable screen recording'] = staticArgClosure1(setScreenshots, true),
		['Remove the ban on screen recording'] = staticArgClosure1(setScreenshots, false),
		['Disable XP framework'] = checkXposed,
		['local storage'] = storages.create,
		['My storage'] = functions.singleton(staticArgClosure1(storages.create, 'My storage')),
		['Load script'] = load,
		['Execute code'] = function(code, ...)
			local func = assert(load(code))
			return func(...)
		end,
		['Load script file'] = loadfile,
		['Execute script'] = function(path, ...)
			local func = assert(loadfile(path))
			return func(...)
		end,
		['Protected call'] = pcall,
		['Selection parameters'] = select,
		['number of parameters'] = function(...)
			return select('#', ...)
		end,
		['Data type'] = type,
		['print'] = print,
	
		['Draw text'] = draw.text,
	
		['QQ chat'] = qq.join,
		['join group'] = qq.joinGroup,
	
		['Get screen width'] = device.getWidth,
		['Get screen height'] = device.getHeight,
		['Get IMEI'] = device.getimei,
	
		['Timed Task'] = timers.setInterval,
		['Cancel scheduled task'] = timers.clearInterval,
		['One-time scheduled task'] = timers.setTimeout,
		['Cancel one-time timed task'] = timers.clearTimeout,
	
		['Get multithreading'] = luajava.getThread,
		['Start multithreading'] = luajava.startThread,
	
		['Multi-thread callback'] = functions.thread,
		['Function synchronization callback'] = functions.synchronized,
		['Function singleton callback'] = functions.singleton,
	
		['exit'] = os.exit,
		['timestamp'] = os.time,
	
		['random number'] = math.random,
	
		['Start application'] = app.start,
		['Open URL'] = app.openUrl,
		['End program'] = app.exit,
		['Application Name'] = app.getName,
		['Application installation package'] = app.getPath,
		['Application Icon'] = app.loadIcon,
		['Install application'] = app.install,
		['Uninstall application'] = app.uninstall,
		['Force installation of application'] = getRootExecCallback(app.install),
		['Force uninstall application'] = getRootExecCallback(app.uninstall),
		['Run List'] = app.runList,
	
		['Write out file'] = file.write,
		['Write out a temporary file'] = file.writeTemp,
		['Read file'] = file.read,
		['Delete file'] = file.delete,
		['Delete directory'] = file.rmdir,
		['Create directory'] = file.mkdirs,
		['Forced deletion'] = getRootExecCallback(file.rm),
		['file size'] = file.length,
		['File name'] = file.getName,
		['file directory'] = file.getdir,
		['File rename'] = os.rename,
		['Append file path'] = file.appendPath,
		['Change file name'] = file.changeName, -- just return the modified path
		['Change file extension'] = file.changeExtension, -- just return the modified path
		['Change file permissions'] = file.chmod,
		['File type'] = file.type,
		['File information'] = file.info,
		['File prefix'] = file.prefix,
		['File suffix'] = file.suffix,
		['File time'] = file.lastTime,
		['file MD5'] = file.md5,
		['File hash value'] = file.md,
		['Open file'] = file.open, -- Call system interface
		['Upload file'] = http.upload,
		['Traverse Directory'] = file.traverseDir,
		['Download file'] = file.download,
		['Cache file'] = file.checkUrl,
		['Does the file exist'] = file.exists,
		['Is it a file'] = file.isFile,
		['Is it a directory'] = file.isDir,
		['Copy file'] = file.copy,
		['Copy Directory'] = file.cp,
		['Move file'] = file.move,
		['Move directory'] = file.mv,
		['Execute file'] = file.exec,
		['Execute binary'] = getRootExecCallback(file.cpp),
	
		['Does it start with'] = string.startsWith,
		['Is it the end'] = string.endsWith,
		['Remove leading and trailing spaces'] = string.trim,
		['voice'] = string.toMusic,
		['Convert to hexadecimal'] = string.bin2hex,
		['Hexadecimal to text'] = string.hex2bin,
		['cut text'] = string.split,
		['parse JSON'] = json.decode,
		['URL encoding'] = string.enUrl,
		['URL decode'] = string.deUrl,
		['random text'] = string.random,
		['Random MD5'] = string.randomMD5,
		['XOR text'] = string.xor,
	
		['Installation judgment'] = gg.isPackageInstalled,
		['Set configuration'] = gg.setConfig,
		['Get configuration'] = gg.getConfig,
		['Get Clipboard'] = gg.getClipboard,
		['Write to clipboard'] = gg.copyText,
		['Get other modifiers'] = gg.getGG,
		['Set process'] = gg.setProcess,
		['Get process'] = gg.getProcess,
		['Request network'] = gg.makeRequest,
		['toast'] = gg.toast,
		['prompt'] = gg.alert,
		['Title prompt'] = gg.alert2,
		['Prompt HTML'] = gg.htmlAlert,
		['Music'] = gg.playMusic,
		['Video'] = gg.playVideo,
		['delay'] = gg.sleep,
		['search'] = gg.searchNumber,
		['Get search count'] = gg.getResultCount,
		['Clear search'] = gg.clearResults,
		['Clear list'] = gg.clearList,
		['improvement'] = gg.refineNumber,
		['modify'] = gg.editAll,
		['Copy Memory'] = gg.copyMemory,
		['Select single'] = gg.choice,
		['Select multiple'] = gg.multiChoice,
		['Input with prompt'] = gg.prompt,
		['Set memory'] = gg.setRanges,
		['Get results'] = gg.getResults,
		['search result'] = function()
			return gg.getResults(gg.getResultCount())
		end,
		['Kill other modifiers'] = gg.loopKillGG,
		['Current file'] = gg.getFile,
		['Is the interface visible'] = gg.isVisible,
		['Set interface visible'] = gg.setVisible,
		['Display interface'] = staticArgClosure1(gg.setVisible, true),
		['Hide interface'] = staticArgClosure1(gg.setVisible, false)
	}
	
	local fix = {
		['Convert string'] = 'Convert text',
		['Voice broadcast'] = 'Voice',
		['Play voice'] = 'Voice',
		['Play music'] = 'Music',
		['Play video'] = 'Video',
		['Sleep'] = 'Delay',
		['Kill other GG'] = 'Kill other modifiers',
		['Open website'] = 'Open URL',
		['Current script'] = 'Current file',
		['Get Directory'] = 'File Directory',
		['Application Name'] = 'Application Name',
		['File Download'] = 'Download file',
		['File timestamp'] = 'File time',
		['Encoding URL'] = 'URL encoding',
		['Toast'] = 'Toast',
		['Get other GG'] = 'Get other modifiers',
		['Prompt 2'] = 'Prompt with title',
		['Output'] = 'Print'
	}
	
	for k, v in pairs(fix) do
		map[k] = map[v]
	end
	
	return map
end

local function mapToGlobal(map)

	pcall(function()
		local t = {}
		for k, v in pairs(map) do
			if isString(k) then
				t[#t + 1] = string.format('%s=%q', k, k)
			end
		end
		local str = string.format('return {%s}', table.concat(t, ','))
		local fix = assert(load(str, ''))()

		for k, v in pairs(fix) do
			if map[k] == nil then
				_ENV[k] = map[v]
			end
		end
	end)

	for k, v in pairs(map) do
		_ENV[k] = v
	end

	return map
end

local initMap = {
	['Chinese function'] = function(p1)
		if not isTable(p1) then
			p1 = getFunctionMap()
		end
		return mapToGlobal(p1)
	end
}

return mapToGlobal(initMap)
