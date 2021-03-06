# Libs
# ----------
cluster = require 'cluster'
express = require 'express'
request = require 'request'
app = express()

# Express config
# ----------
app.set 'view engine', 'coffee'
app.engine 'coffee', require('coffeecup').__express
app.use express.static "#{__dirname}/public"

# Routes
# ----------
app.get '/', (req, res) ->
  res.render 'index'

app.post '/cloudflare', (req, res) ->
  request.post 'https://www.cloudflare.com/api_json.html',
    form:
      a: 'fpurge_ts'
      tkn: process.env.TKN
      email: process.env.EMAIL
      z: process.env.Z
      v: '1'
    , (error, response, body) ->
      console.log body
      response
  res.redirect '/'
app.post '/playfm', (req, res) ->
  request.post "http://playfm.cl/#{process.env.VARNISH}",
    (error, response, body) ->
      console.log body
      response
  res.redirect '/'
app.post '/sonar', (req, res) ->
  request.post "http://sonarfm.cl/#{process.env.VARNISH}",
    (error, response, body) ->
      console.log body
      response
  res.redirect '/'
app.post '/top', (req, res) ->
  request.post "http://topfm.cl/#{process.env.VARNISH}",
    (error, response, body) ->
      console.log body
      response
  res.redirect '/'
app.post '/oasis', (req, res) ->
  request.post "http://oasisfm.cl/#{process.env.VARNISH}",
    (error, response, body) ->
      console.log body
      response
  res.redirect '/'
app.post '/horizonte', (req, res) ->
  request.post "http://horizonte.cl/#{process.env.VARNISH}",
    (error, response, body) ->
      console.log body
      response
  res.redirect '/'
# App
# ----------
IP = process.env.IP or '127.0.0.1'
PORT = process.env.PORT or 8080
FORKS = process.env.FORKS or 1
if cluster.isMaster
  cluster.fork() for i in [0...FORKS]
  cluster.on 'death', (worker) ->
    cluster.fork()
else
  app.listen PORT, IP
