var sys = require('util')
var exec = require('child_process').exec;
function puts(error, stdout, stderr) {sys.puts(stdout)}
exec("python project.py", puts);