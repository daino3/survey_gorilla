post '/delete_question' do
  Question.destroy(params[:id])
end

get '/delete_survey/:survey_id' do
  Survey.destroy(params[:survey_id])
  redirect "/#{params[:current_page]}"
end