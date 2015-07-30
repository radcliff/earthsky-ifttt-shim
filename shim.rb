class Shim < Sinatra::Base
  register Sinatra::Contrib

  configure do
    set :IFTTT_CHANNEL_KEY, ENV['IFTTT_CHANNEL_KEY']
  end

  namespace '/ifttt' do
    namespace '/v1' do

      before do
        unless env['HTTP_IFTTT_CHANNEL_KEY'] == settings.IFTTT_CHANNEL_KEY
          halt 401, { 'Content-Type': 'text/plain' }, 'Invalid IFTTT channel key!'
        end
      end

      get '/status' do
        status 200
      end

    end
  end

end
