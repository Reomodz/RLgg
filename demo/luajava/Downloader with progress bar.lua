local url = 'https://downv6.qq.com/qqweb/QQ_1/android_apk/Android_8.9.71_64.apk'
local path = gg.EXT_STORAGE .. url:match('/[^/]+$')
local msg = 'Downloading QQ, please wait...' .. '\n' .. path
local ok, err = luajava.download(url, path, msg)
if not ok then
	error('Download failed：' .. err)
end
