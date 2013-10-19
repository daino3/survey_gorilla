get '/' do
  if current_user
    redirect '/create_survey'
  else
    erb :index
  end
end

get '/create_survey' do
  current_user
  erb :create_survey
end

post '/create_survey' do
  @survey = Survey.create(title: params[:survey_title], creator_id: current_user.id)
  puts "____________________________________"
  p current_user.id
  puts "____________________________________"
  if params[:image] 
    @photo = Photo.create(title: params[:image_title], file: params[:image])
    @survey.photo = @photo
  end

  erb :create_question
end

get '/create_question' do
  @survey = Survey.find(params[:survey])
  @photo = @survey.photo
  erb :create_question
end

post '/create_question' do
  @survey = Survey.find(params[:survey])
  @question = Question.create(prompt: params[:question], survey_id: @survey.id)
  create_choices(params[:choice_input], @question.id)

  if params[:submit] == "Finish"
    redirect "/view_survey/#{@survey.id}"
  elsif params[:submit] == "Add Question"
    @photo = @survey.photo
    erb :create_question
  end
end

get '/take_survey/:survey_id' do
  @survey = Survey.find(params[:survey_id])
  erb :take_survey
end

post '/take_survey' do
  @survey = Survey.find(params[:survey_id])
  create_responses(params[:response_input], current_user.id)
  redirect "/view_survey/#{@survey.id}"
end

get '/view_survey/:survey_id' do
  @survey = Survey.find(params[:survey_id])
  erb :view_survey
end

get '/view_all_surveys' do 
  @surveys = Survey.all
  erb :view_all_surveys
end
