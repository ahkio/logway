require 'sinatra'

post '/' do
  logger.info request.body.read
end

get '/' do
  'Logway, by Ahkio.'
end
