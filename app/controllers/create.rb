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
