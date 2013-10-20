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
  if @survey.questions.count > 0
    create_responses(params[:response_input], current_user.id)
    Takensurvey.create(survey_id: @survey.id, user_id: current_user.id)
  end
  redirect "/view_survey/#{@survey.id}"
end