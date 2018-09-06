require 'rspec'
require File.expand_path '../../../hello.rb', __FILE__

describe 'My Hello App' do

  it "says Hello" do
    get '/'
    expect(last_response).to be_okay
    expect(last_response.body).to eq('Hello')
  end
end