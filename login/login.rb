require 'sinatra'
require 'json'

USERNAME = 'isocket';
PASSWORD = 'rocks!';

get '/' do
  send_file File.dirname(__FILE__) + '/login.html'
end

post '/' do
  result = {}

  if params[:username] == USERNAME && params[:passwd] == PASSWORD
    result[:success] = true
  else
    result[:errors] = []
    result[:errors] << :username unless params[:username] == USERNAME
    result[:errors] << :passwd unless params[:passwd] == PASSWORD
  end

  content_type :json
  result.to_json
end