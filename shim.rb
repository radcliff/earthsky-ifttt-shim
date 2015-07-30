class Shim < Sinatra::Base
  register Sinatra::Contrib

  configure do
    set :IFTTT_CHANNEL_KEY, ENV['IFTTT_CHANNEL_KEY']
  end

  namespace '/ifttt' do
    namespace '/v1' do

      before do
        unless env['HTTP_IFTTT_CHANNEL_KEY'] == settings.IFTTT_CHANNEL_KEY
          halt 401, { 'Content-Type': 'application/json;charset=utf-8' }, json( { errors: [ { message: 'Invalid IFTTT channel key!' } ] } )
        end
      end

      get '/status' do
        status 200
      end

      post '/test/setup' do
        headers 'Content-Type': 'application/json;charset=utf-8'
        status 200
        json data: { samples: { triggers: { "new_tonight_post": {} } } }
      end

      post '/triggers/new_tonight_post' do
        params = JSON.parse(request.body.read)
        limit = params['limit'] || 3

        headers 'Content-Type': 'application/json;charset=utf-8'
        status 200

        # post = Post.fetch
        posts = Post.archive(limit)

        json data: posts
      end

    end
  end

end
