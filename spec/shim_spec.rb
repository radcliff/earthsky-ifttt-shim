require_relative "spec_helper"
require_relative "../shim.rb"

describe Shim do
  include Rack::Test::Methods

  def app
    Shim
  end

  describe 'conformms to IFTTT channel protocol:' do
    context 'a /status endpoint' do
      it 'exists' do
        get '/ifttt/v1/status', nil, { IFTTT_CHANNEL_KEY: ENV['IFTTT_CHANNEL_KEY'] }
        expect(last_response.status).to eq(200)
      end

      it 'returns 401 with an invalid channel key' do
        get '/ifttt/v1/status', nil, { IFTTT_CHANNEL_KEY: 'INVALID' }
        expect(last_response.status).to eq(401)
      end
    end

    context 'a /test/setup endpoint' do
      it 'exists' do
        post '/test/setup', nil, { IFTTT_CHANNEL_KEY: ENV['IFTTT_CHANNEL_KEY'] }
        expect(last_response.status).to eq(200)
      end
    end

    end
  end

end
