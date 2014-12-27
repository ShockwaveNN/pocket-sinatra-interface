require 'sinatra'
require 'sinatra/config_file'
require 'haml'
require 'json'
require 'pocket'
config_file 'config.yaml'


enable :sessions


def callback_url
  "#{request.base_url}/oauth/callback"
end

Pocket.configure do |config|
  config.consumer_key = settings.consumer_key
end

get '/reset' do
  puts "GET /reset"
  session.clear
end

get "/" do
  puts "GET /"
  puts "session: #{session}"

  if session[:access_token]
    '
<a href="/add?url=http://getpocket.com">Add Pocket Homepage</a>
<a href="/retrieve">Retrieve single item</a>
<a href="/upload">Upload an xml</a>
    '
  else
    '<a href="/oauth/connect">Connect with Pocket</a>'
  end
end

get "/oauth/connect" do
  puts "OAUTH CONNECT"
  session[:code] = Pocket.get_code(:redirect_uri => callback_url)
  new_url = Pocket.authorize_url(:code => session[:code], :redirect_uri => callback_url)
  puts "new_url: #{new_url}"
  puts "session: #{session}"
  redirect new_url
end

get "/oauth/callback" do
  puts "OAUTH CALLBACK"
  puts "request.url: #{request.url}"
  puts "request.body: #{request.body.read}"
  result = Pocket.get_result(session[:code], :redirect_uri => callback_url)
  session[:access_token] = result['access_token']
  puts result['access_token']
  puts result['username']
  puts session[:access_token]
  puts "session: #{session}"
  redirect "/"
end

get '/add' do
  client = Pocket.client(:access_token => session[:access_token])
  info = client.add :url => 'http://getpocket.com'
  "<pre>#{info}</pre>"
end

get "/upload" do
  haml :upload
end

# Handle POST-request (Receive and save the uploaded file)
post "/upload" do
  client = Pocket.client(:access_token => session[:access_token])
  filename = 'uploads/' + params['myfile'][:filename]
  File.open(filename, "w") do |f|
    f.write(params['myfile'][:tempfile].read)
  end
  json_content = JSON.parse( IO.read(filename))
  urls = []
  json_content.each do |cur|
    urls << cur['url']
  end
  added_url_data = ''
  urls.each do |cur_url|
    info = client.add :url => cur_url
    added_url_data += "<p>Added: #{info}</p>"
  end
  added_url_data
end

