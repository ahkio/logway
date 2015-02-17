post '/' do
  log = "log/logway.log"
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
