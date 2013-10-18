get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/upload_photo' do
  erb :upload_photo
end

post '/upload_photo' do
  Photo.create(title: params[:title], file: params[:image])
  redirect '/'
end
