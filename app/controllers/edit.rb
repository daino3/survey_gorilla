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