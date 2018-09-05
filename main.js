var {app, BrowserWindow} = require('electron');
var path = require('path')

var mainWindow = null;
var lib
if (process.platform != 'win32') {
	lib = path.join(__dirname, 'libppapi_hello.so')
} else {
	lib = path.join(__dirname, 'libppapi_hello')
	if (process.arch == 'x64') {
		lib = path.join(lib, 'x64')
	}
	lib = path.join(lib, 'Release', 'libppapi_hello.dll')
}

var plugin = lib + ';application/x-hello'
console.log(plugin)

app.commandLine.appendSwitch('register-pepper-plugins', plugin)

app.on('ready', function() {
  mainWindow = new BrowserWindow({
    height: 800,
    width: 1024,
    title: 'electron',
    webPreferences : {
      'plugins': true,
      devTools: true,
    }
  });

  mainWindow.loadURL('file://' + __dirname + '/nacl.html');
});
