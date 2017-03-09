myIP = require('my-ip')
colors    = require('colors')
args = process.argv.slice(2)
console.log '============================================='.cyan
console.log 'Your '+'IPv6'.yellow+' is ' + (myIP 'IPv6').green
console.log 'Your '+'IPv4'.yellow+' is ' + (myIP 'IPv4').green
console.log 'Port'.yellow + ': ' + ((args[3] || 2467) + '').magenta
console.log '============================================='.cyan

READ = (q, f) ->
	ret = null
	readline = require('readline')
	rl = readline.createInterface(
		input: process.stdin
		output: process.stdout)

	rl.question q, (answer) ->
		rl.close()
		f answer

exec = require('child_process').exec
		
request   = require('request')



path = require('path');
fs   = require('fs');
lib  = path.join(path.dirname(fs.realpathSync(__filename)), '../lib');

	
send = (nick, chatter, message) ->
	port = 2467
	request.post({url:'http://'+chatter+':' + port, form: {message: message, nick: nick.blue}})
	request.post({url:'http://127.0.0.1:' + port, form: {message: message, nick: 'You'.blue}})
	READ '>>> '.blue, (message) ->
		send(nick, chatter, message)

if not args[0]
	READ 'Your '+'nickname'.yellow+': ', (nick) -> 
		READ 'Your '+'chatter\'s IP'.yellow+': ', (chatter) -> 
			exec 'start node '+lib+'/server ' + chatter
			console.log 'Enter '+'message'.yellow+':'
			READ '>>> '.blue, (message) ->
				send(nick, chatter, message)

else
	chatter   = args[0]
	message   = args[2]


	nick = args[1]
	port      = args[3] || 2467
	request.post({url:'http://'+chatter+':' + port, form: {message: message, nick: nick.blue}})
	request.post({url:'http://127.0.0.1:' + port, form: {message: message, nick: 'You'.blue}})
