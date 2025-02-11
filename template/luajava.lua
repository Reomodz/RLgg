---@alias varargs ... @Variable parameters, any type and any number
---@alias varargClass string|java.lang.Class
---@alias proxyMethod table<string, function>
---@alias resid number

---@class luajava
---@field getRunnable fun(run:function):java.lang.Runnable
---@field getMethods fun(className:string):table @java.lang.reflect.Method[]
---@field getThread fun(run:function, name?:string):java.lang.Thread
---@field getHandler fun():android.os.Handler @android.os.Handler(android.os.Looper.getMainLooper())
---@field getObjectField fun(userdata:java.lang.Objec, fieldName:string):any @Get object fields
---@field getStaticObjectField fun(userdata:java.lang.Class, fieldName:string):any @Get Class static fields
---@field getFloatingWindow fun():android.widget.ImageView @Get the image of the GG floating window
---@field getBitmap fun(src:path|url):android.graphics.Bitmap
---@field getBitmapDrawable fun(src:path|url):android.graphics.drawable.BitmapDrawable
---@field getDrawable fun(src:path|url|res):android.graphics.drawable.BitmapDrawable @Supports URL, local file or getIdentifier name parameter
---@field getResID fun(name:string):resid @The id obtained from the drawable type, return getIdentifier(name, 'drawable')
---@field getIdentifier fun(name:string, defType?:string, defPackage?:string):resid
---@field getIdentifier fun(name:string):resid @ -> @android:drawable/ic_menu_preferences
---@field getIdentifier fun(name:string):resid @ -> ?ic_ui_button_24dp
---@field getIdentifierDrawable fun(name:string, defType?:string, defPackage?:string):android.graphics.drawable.BitmapDrawable
---@field getResBitmap fun(resid:resid):android.graphics.Bitmap @ Get the id through getIdentifier to create a Bitmap
---@field getResDrawable fun(name:string):android.graphics.drawable.BitmapDrawable @ Get Bitmap through getResBitmap and create BitmapDrawable
---@
---@field newId fun(name:string):number
---@field getId fun(name:string):number|nil
---@field getIdValue fun(name:string):table|nil @Deprecated, use getIdView instead
---@field getIdView fun(name:string):android.view.View|nil
---@
---@field setInterface fun(userdata:java.lang.Object, methodName:string, override:(function|proxyMethod))
---@field setObjectField fun(userdata:java.lang.Objec, fieldName:string, value:any) @Set object fields
---@field setStaticObjectField fun(userdata:java.lang.Class, fieldName:string, value:any) @Set Class static fields
---@field setFloatingWindowAttr fun(layout_attr:table) @Set the getFloatingWindow() View's properties
---@field setFloatingWindowHide fun(hide:boolean) @Set getFloatingWindow() View to be hidden, and it will automatically become visible after the script ends.
---@
---@field isMainThread fun():boolean @Determine whether the current thread is the main thread
---@field isGGThread fun():boolean @Determine whether the current thread is the thread of the modifier's operating environment
---@field isThread fun():boolean @Determine whether the current thread is not the main thread (equivalent to a normal thread)
---@field instanceOf fun(userdata:java.lang.Object, is:java.lang.Class):boolean
---@
---@field iterator fun(data:java.util.Iterator):function @Get Lua iterator
---@field ipairs fun(data:userdata[]):function @Get Lua iterator
---@field astable fun(data:java.util.ArrayList):table @change table
---@field list fun(data:java.util.List):table
---@field array fun(data:java.lang.Object[]):table
---@field iteratorValues fun(data:java.util.Iterator):table @Get all the values of the iterator
---@field stringToByte fun(data:string):byte[]
---@field table fun(data:userdata):table @ luajava.table The result is traversed through luajava.ipairs
---@
---@field new fun(Class:java.lang.Class, vararg?:any):java.lang.Object
---@field newinstacne fun(Class:java.lang.Class, vararg?:any):java.lang.Object
---@field newByte fun(length:number):byte[]
---@
---@field newAlert fun():android.app.AlertDialog.Builder
---@field showAlert fun(alert:android.app.AlertDialog|android.app.AlertDialog.Builder)
---@field showViewAlert fun(view:android.widget.View) @ newAlert + showAlert
---@field newToast fun(text:string, fast:boolean):android.widget.Toast
---@field showToast fun(toast:android.widget.Toast)
---@field toast fun(text:string, fast:boolean):android.widget.Toast @ newToast + showToast
---@field showViewToast fun(view:android.widget.View):android.widget.Toast @ newToast + showToast
---@
---@field bindClass fun(className:string):java.lang.Class | error @If className is not found, false will be returned, and the exception message
---@field bindClass2 fun(className:string):java.lang.Class @If className is not found, an exception will be thrown directly
---@field startThread fun(run:function, name?:string):java.lang.Thread @Start the thread and return an instance
---@field currentThread fun():java.lang.Thread @Return the current thread
---@field threadJoin fun(thread:java.lang.Thread, millis:number, nanos?:number) @The current thread enters blocking until the target thread times out or ends
---@field postMain fun(run:function, vararg:any):any @Synchronously execute the UI thread, the return value is the result of pcall
---@field post fun(run:function, vararg:any):any @If run executes abnormally, an exception is thrown, otherwise the execution result of run is returned
---@field runOnUiThread fun(run:function) @Asynchronous execution of UI thread, no return value, no support for parameters, and no exceptions thrown
---@field download fun(url:string, path:string, msg?:string):boolean, error
---@field callMethod fun(userdata:java.lang.Objec, methodName:string, vararg:...):any @Call object method
---@field callStaticMethod fun(userdata:java.lang.Class, methodName:string, vararg:...):any @Call object static method
---@field webView fun(onCreate:function):android.webkit.WebView @Set Class static fields
---@
---@field getBlock fun() @Deprecated, luajava.getLockSupport is recommended
---@field setListener fun() @Deprecated
luajava = {}

---@alias typemode
---| '0' #byte
---| '1' #char
---| '2' #short
---| '3' #int
---| '4' #long
---| '5' #float
---| '6' #double

---@param type typemode
---@param data string
---@return number
function luajava.numberToJava(type, data) end

---@param vararg string|java.lang.Class
---@param proxyMethod table<string, function>
---@return java.lang.Object
function luajava.createProxy(vararg, proxyMethod) end


---@alias park function @Support the current thread to enter sleep
---@alias unpark function @To unpark a thread that has entered sleep mode, you can first call unpark
---@return park, unpark
function luajava.getLockSupport() end


---@class layoutInfo:layout
---@field public 1 java.lang.Class|android.view.View|android.view.ViewGro

---@alias layoutInfos layoutInfo[]
---@param layout layoutInfos
---@param env?table
---@param parent?android.view.ViewGroup
function luajava.loadlayout(layout,env,parent) end
