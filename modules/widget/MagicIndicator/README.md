# MagicIndicator

## introduce

MagicIndicator is a module introduced from github open source project

https://github.com/hackware1993/MagicIndicator





## Usage

Use the dex.getMagicindicator method to load the dex module (downloaded from the cloud)

Specific class name rlyun.modules.widget.ViewPagerMagicIndicator



~~~lua
-- Load Magicindicator dependency

-- dalvik.system.DexClassLoader
local Magicindicator = dex.getMagicindicator()
local classname = 'rlyun.modules.widget.ViewPagerMagicIndicator'
local ViewPagerMagicIndicatorClass = Magicindicator:loadClass(classname)

~~~



Since Lua cannot directly inherit Java classes, I wrote a Java adapter class to implement the proxy in Lua

ViewPagerMagicIndicator has a BaseImpl interface inside. To create a ViewPagerMagicIndicator, you must implement BaseImpl as a construction parameter.



Object = Create ViewPagerMagicIndicator (implements ViewPagerMagicIndicator.BaseImpl)



> ViewPagerMagicIndicator.BaseImpl

| Method name | Required | Return value type | Description |
| --------------- | -------- | ---------------------------------- | ---------------------------- |
| getCount | is | number | the total number of items |
| getTitleView | No | android.view.View | Individual item title |
| getIconDrawable | No | android.graphics.drawable.Drawable | Individual project title icon |
| getContextView | is | android.view.View | specific display content of individual projects |



For further encapsulation, please see [luajava.getViewPagerMagicIndicator.lua](../../../src/luajava/luajava.getViewPagerMagicIndicator.lua)

For usage examples, see [Bottom navigation-page layout.lua](../../../demo/luajava/Bottom navigation-page layout.lua)

