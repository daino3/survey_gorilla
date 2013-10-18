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
    redirect "/view_survey/#{@survey.id}"
  elsif params[:submit] == "Add Question"
    erb :create_question
  end
end

get '/take_survey/:survey_id' do
  @survey = Survey.find(params[:survey_id])
  erb :take_survey
end

post '/take_survey' do
  @survey = Survey.find(params[:survey_id])
  create_responses(params[:response_input])#, current_user.id)
  redirect "/view_survey/#{@survey.id}"
end

get '/view_survey/:survey_id' do
  @survey = Survey.find(params[:survey_id])
  erb :view_survey
end
