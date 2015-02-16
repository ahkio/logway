post '/' do
  log = 'log/logway.log'
  data = request.body.read

  io = File.open(log, 'a+') { |f| f.write("#{data}\n") }

  code = io ? 200 : 500
  status code
end

get '/' do
  'Logway, by Ahkio.'
end
