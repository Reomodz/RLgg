--[[

1. In RLGG-APK configuration
resources.arsc>ID location resource>0x7f0d0008>change the content to 1

]] --

--[[
2.Execute gg.setProcessX to pop up the process selection
gg.setProcessX()
It is not recommended to use it in pure scripts. If you must use it, you should write it in the UI to let the user click and then pop up the process selection

]] --

--[[
3.Execute gg.setProcess to set the process

]] --

local pkg = 'Package Name'
gg.setProcess(pkg)
if gg.getTargetPackage() ~= pkg then
	gg.alert2('Please run the process first', pkg)
	os.exit()
	return
end

--[[
4. Execute checkPkg to select the process

It is recommended to verify whether the package name is correct before enabling the function, so that no exceptions will be caused by incorrect process selection

]] --

checkPkg({'Package name 1', 'Package name 2'})