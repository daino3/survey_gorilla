get '/view_survey' do
  @surveys = Survey.order("updated_at DESC")
  erb :view_all_surveys_view
end

get '/view_survey/:survey_id' do
  @survey = Survey.find(params[:survey_id])
  erb :view_survey
end

get '/view_all_surveys_take' do 
  @surveys = Survey.order("updated_at DESC")
  erb :view_all_surveys_take
end