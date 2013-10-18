get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/create_survey' do
  current_user
  erb :create_survey
end

post '/create_survey' do
  puts params
  @survey = Survey.create(title: params[:survey_title]) #, user_id: session[:user_id])
  
  if params[:image] 
    @photo = Photo.create(title: params[:image_title], file: params[:image])
    @survey.photo = @photo
  end

  erb :create_question
end

get '/create_question' do
  erb :create_question
end

post '/create_question' do
  @survey = Survey.find(params[:survey])
  @question = Question.create(prompt: params[:question], survey_id: @survey.id)
  create_choices(params[:choice_input], @question.id)

  if params[:submit] == "Finish"
    erb :view_survey
  elsif params[:submit] == "Add Question"
    erb :create_question
  end
end
