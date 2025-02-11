# AndroidViewAnimations

## introduce

AndroidViewAnimations is a module introduced from github open source project

https://github.com/daimajia/AndroidViewAnimations





## Usage

Use the dex.getYoYoImpl method to load the dex module (downloaded from the cloud)

Specific class name rlyun.modules.animation.YoYoImpl

YoYo will depend on androidx, so when loading dex, androidx will be used as the parent loader to instantiate YoYo's dalvik.system.DexClassLoader



Further encapsulated into luajava.getYoYoImpl

~~~lua
luajava.getYoYoImpl = functions.singleton(function()
	local loader = dex.getYoYoImpl()
	return loader:loadClass('rlyun.modules.animation.YoYoImpl')
end)
~~~



For usage examples, see [View animation.lua](../../../demo/luajava/View animation.lua)



If you need to set a listening event, you can use luajava.getYoYoCallback to create a callback object



>luajava.getYoYoCallback

| Parameter name | Type | Description | Return value type |
| -------- | -------- | -------- | --------------------------------------------------------------- |
| callback | function | callback function | com.daimajia.androidanimations.library.YoYo$AnimatorCallback |

