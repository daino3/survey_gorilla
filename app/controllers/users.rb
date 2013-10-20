##################### USERS! #########


#========== GET ==========#
get '/logout' do
  session.clear
  redirect '/'
end


#========== POST =========#
post '/login' do
  @user = User.find_by_email(params[:email])
  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect '/'
  else
    @login_error = "Invalid Login"
    erb :index
  end
end

post '/signup' do
  @user = User.create(params[:input])
  if @user.valid?
    session[:user_id] = @user.id
    redirect '/'
  else
    @errors = @user.errors
    erb :index
  end
end

