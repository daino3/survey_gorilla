get '/' do
  if current_user

    erb :home
  else
    erb :index
  end
end

get '/create_survey' do
  if current_user
    current_user
    erb :create_survey
  else
    redirect '/'
  end
end

post '/create_survey' do
  if current_user
    @survey = Survey.create(title: params[:survey_title], creator_id: current_user.id)
    if params[:image] 
      @photo = Photo.create(title: params[:image_title], file: params[:image])
      @survey.photo = @photo
    end
    erb :create_question
  else
    redirect '/'
  end
end

get '/create_question' do
  if current_user
    @survey = Survey.find(params[:survey])
    @photo = @survey.photo
    erb :create_question
  else
    redirect '/'
  end
end

post '/create_question' do
  if current_user
    @survey = Survey.find(params[:survey])
    @question = Question.create(prompt: params[:question], survey_id: @survey.id)
    create_choices(params[:choice_input], @question.id)

    if params[:submit] == "Finish"
      redirect "/view_survey/#{@survey.id}"
    elsif params[:submit] == "Add Question"
      @photo = @survey.photo
      erb :create_question
    end
  else
    redirect '/'
  end
end

get '/take_survey/:survey_id' do
  @survey = Survey.find(params[:survey_id])
  if current_user
    erb :take_survey
  else
    redirect "/view_survey/#{@survey.id}"
  end
end

post '/take_survey' do
  @survey = Survey.find(params[:survey_id])
  create_responses(params[:response_input], current_user.id)
  Takensurvey.create(survey_id: @survey.id, user_id: current_user.id)
  redirect "/view_survey/#{@survey.id}"
end

get '/view_survey' do
  @surveys = Survey.order("updated_at DESC")
  erb :view_all_surveys_view
end

get '/view_survey/:survey_id' do
  @survey = Survey.find(params[:survey_id])
  erb :view_survey
end

get '/view_all_surveys' do 
  @surveys = Survey.order("updated_at DESC")
  erb :view_all_surveys
end

get '/edit_survey/:survey_id' do
  @survey = Survey.find(params[:survey_id])
  if current_user.id == @survey.creator_id
    erb :edit_survey
  else
    redirect '/'
  end
end

post '/edit_survey' do
  @survey = Survey.find(params[:survey])
  @survey.update_attributes(title: params[:survey_title])
  if params[:image] 
    @photo = Photo.create(title: params[:image_title], file: params[:image])
    @survey.photo = @photo
  else
    @photo = @survey.photo
  end
  @photo.update_attributes(title: params[:image_title])
  redirect "/edit_survey/#{@survey.id}"
end

post '/delete_question' do
  Question.destroy(params[:id])
end
