class Shim < Sinatra::Base
  register Sinatra::Contrib

  get '/' do
    status 200
    body "unofficial earthsky tonight ifttt shim"
  end
end
