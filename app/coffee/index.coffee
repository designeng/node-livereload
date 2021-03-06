PORT = 3000

connect = require 'connect'
http = require 'http'

date = new Date()

console.log date.getTime()

output = (req, res) ->
    res.setHeader('Content-Type', 'text/html')
    res.write("<head><script src='//localhost:35729/livereload.js'></script></head>")
    res.write("<p>Now: #{date.getTime()}</p>")
    res.end()

app = connect()
    .use(output)

console.log("Server started at port #{PORT}");
http.Server(app).listen(PORT)