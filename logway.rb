post '/' do
  today = Date.today.strftime("%Y-%m-%d")
  log = "log/logway-#{today}.log"
  data = request.body.read

  io = File.open(log, 'a+') { |f| f.write("#{data}") }

  code = io ? 200 : 500
  status code
end

get '/' do
  'Logway, by Ahkio.'
end
