get '/' do
  if current_user

    erb :home
  else
    erb :index
  end
end