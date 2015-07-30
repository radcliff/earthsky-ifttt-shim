require_relative "spec_helper"
require_relative "../shim.rb"

describe Shim do

  def app
    Shim
  end

  it 'works' do
    get '/'
    expect(last_response).to be_ok
  end

  describe 'conformms to IFTTT channel protocol' do
    xit 'works' do
    end 
  end

end
