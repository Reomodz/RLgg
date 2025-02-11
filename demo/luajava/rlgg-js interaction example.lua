--[[

The function called by js belongs to multi-threading and can execute gg function

Normal parameters must be strings
Call parameters must be a string set, such as ['parameter 1', 'parameter 2']

rlgg.call, rlgg.calls The first parameter of the callback function is always webView

rlgg in js has the following methods:

Call RLGG global function
1. rlgg.call
rlgg.call("function name");

2. rlgg.calls
Call RLGG global function with parameters
rlgg.call("function name",['parameters','theoretically unlimited number of parameters, I haven't tested too many']);

3. rlgg.callMember
Call member function with parameters
rlgg.callMember('gg','alert',['hello','yes','no']);

4. rlgg.load
rlgg.load('gg.alert("js executes lua code")');

5. rlgg.log
rlgg.log('print string');

6. rlgg.logs
rlgg.logs(['print string set','second parameter']);

]] -- 
local windowManager = require('windowManager')
local LayoutParams = luajava.bindClass('android.view.WindowManager$LayoutParams')
local viweManager

function func(webView)
	gg.alert('hello')
end

function func2(webView, arg1, arg2, ...)
	print('func2')
	print('arg1=', arg1)
	print('arg2=', arg2)
end

_ENV['exit-webView'] = function(webView)
	viweManager:exit()
end

_ENV['login-submit'] = function(webView, user, password)
	-- Demonstration of getting the content of html
	gg.alert2('Log in', string.format('user:%s\npassword:%s', user, password))

	luajava.post(function()
		-- The return key fails to work after the input method is released
		viweManager:getLayoutParams().flags = LayoutParams.FLAG_NOT_FOCUSABLE
		viweManager:updateView()

		-- Return to previous page
		webView:goBack()
	end)
end

_ENV['login-test'] = function(webView)

	-- If you need to interact with the view, you must be in the UI thread. luajava.post belongs to the UI thread.
	luajava.post(function()
		-- Allow View to obtain input method
		viweManager:getLayoutParams().flags = LayoutParams.FLAG_NOT_TOUCH_MODAL
		viweManager:updateView()

		-- Load a new page. You can also use loadUrl to load an online website URL or a local file. It depends on your needs. You need to know a little bit about Java and android.webkit.WebView.
        webView:loadData([[
<!DOCTYPE html>
<html>

<head>
	<title>User Login</title>
	<style>
		body {
			font-family: Arial, sans-serif;
			background-color: #f4f4f4;
			margin: 0;
			padding: 20px;
		}

		.login-form {
			max-width: 300px;
			margin: 0 auto;
			background-color: #fff;
			padding: 20px;
			border-radius: 5px;
			box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
		}

		.login-form h2 {
			text-align: center;
		}

		.login-form input[type="text"],
		.login-form input[type="password"] {
			width: 100%;
			padding: 8px;
			margin-bottom: 10px;
			border: 1px solid #ccc;
			border-radius: 4px;
			box-sizing: border-box;
		}

		.login-form button {
			width: 100%;
			background-color: #4CAF50;
			color: #fff;
			padding: 10px;
			border: none;
			border-radius: 4px;
			cursor: pointer;
		}

		.login-form button:hover {
			background-color: #45a049;
		}
	</style>
</head>

<body>
	<div class="login-form">
		<h2>User Login</h2>
		<form>
			<input type="text" id="username" placeholder="Username" required>
			<input type="password" id="password" placeholder="Password" required>
			<button onclick="login()">Login</button>
		</form>
	</div>
</body>

<script type="text/javascript">

	var loginForm = document.getElementById('login-form');
	var usernameInput = document.getElementById('username');
	var passwordInput = document.getElementById('password');

	function login() {
		// Get the value of the text box and password box
		var username = usernameInput.value;
		var password = passwordInput.value;

		if (username == '' || password == '') {
			return;
		}
		rlgg.calls("login-submit", [username, password]);
	}

</script>

</html>
		]], 'text/html', 'UTF-8')

	end)

end

local webView = luajava.webView(function(webView)
	webView:loadData([[
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<title>Title</title>
	<h1>欢迎使用RLGG</h1>
	<input type="button" value="js calls rlgg function" onclick="test1()">
	<input type="button" value="js executes lua code" onclick="test2()">
	<input type="button" value="Calling a member function with parameters" onclick="test3()">
	<input type="button" value="Calling rlgg function with parameters" onclick="test4()">
	<input type="button" value="log printing" onclick="test5()">
	<input type="button" value="Login UI" onclick="login()">
	<input type="button" value="quit" onclick="exit()">
	
</head>

<body>
	<script type="text/javascript">
		function test1() {
			rlgg.call("func");
		}

		function test2() {
			rlgg.load('gg.alert("js executes lua code")');
		}

		function test3() {
			rlgg.callMember('gg','alert',['Hello','yes','no']);
		}

		function test4() {
			rlgg.calls('func2',['Parameter 1','Parameter 2']);
		}

		function test5() {
			rlgg.log("Come here rlgg.log");
			rlgg.logs(["1","2","3","The rlgg.logs parameter is a collection of strings."]);
		}

		function login() {
			rlgg.call("login-test");
		}

		function exit() {
			rlgg.call("exit-webView");
		}

	</script>
</body>

</html>
	]], 'text/html', 'UTF-8')

end)

viweManager = windowManager:bindView(webView)
viweManager:show()
viweManager:setMoveable(true)
viweManager:wait()

-- Usually rlgg will automatically recycle the webView created by luajava.webView when the script ends
luajava.post(function()
	webView:destroy()
end)
