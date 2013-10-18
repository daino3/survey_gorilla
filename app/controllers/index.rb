get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/create_survey' do
  current_user
  erb :create_survey
end

post '/create_survey' do
  @survey = Survey.create(title: params[:survey_title]) #, user_id: session[:user_id])
  
  if params[:image] 
    @photo = Photo.create(title: params[:image_title], file: params[:image])
    @survey.photo = @photo
  end

  erb :create_question
end
