args = process.argv.slice(2)

chatter     = args[0]

http        = require('http')
request     = require('request')
queryString = require('query-string')
port        = args[1] || 2467
colors      = require 'colors' 
Cpass       = require('cpass')
cpass       = (new Cpass).decode

s = http.createServer()
s.on 'request', (request, response) ->
  data = ''
  request.on 'data', (chunk) ->
    data += chunk.toString()
    return
  request.on 'end', ->
    parsed = queryString.parse(data)
    console.log cpass(parsed.nick).blue + ': ' + cpass(parsed.message)


    response.write 'This is console chat :D'
    response.end()
    return
  return
s.listen port

console.log 'Chatting with '+'http://'.green+chatter.green+':'.green + (port + '').magenta
console.log 'Messages:'
