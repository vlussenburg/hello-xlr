require 'sinatra'
require 'rspec'
hello_port = ENV['HELLO_PORT'] |= "8080"
set :port, $hello_port

get  '/' do
  "Hello"
end

get '/howdy' do
  "Howdy"
end

get '/hola' do
  "Hola"
end

get '/xlr' do
  "Hello Xebia XL Release"
end
