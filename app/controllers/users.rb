##################### USERS! #########


#========== GET ==========#
get '/logout' do
  session.clear
  redirect '/'
end


#========== POST =========#
post '/login' do
    @user = User.find_by_email(params[:email])
    if @user.password == params[:password]
      session[:id] = @user.id
      redirect "/profile/#{session[:id]}"
    else
      redirect '/login'
    end
  erb :profile
end


post '/newuser' do
  @user = User.create(params[:newuser])
  redirect "/profile/#{@user.id}"
end

