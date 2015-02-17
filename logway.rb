post '/' do
  drain = request.env['HTTP_LOGPLEX_DRAIN_TOKEN'] || 'unknown'
  log = "log/logway-#{drain}.log"
  data = request.body.read

  begin
    File.open(log, 'a+') { |f| f.write("#{data}") }
  rescue
    halt 500
  end

  status 200
end

get '/' do
  'Logway, by Ahkio.'
end
