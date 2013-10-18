def current_user
  @current_user = User.find(session[:user_id]) if session[:user_id]
end

def create_choices(choices_hash, question_id)
  choices_hash.each do |key, value|
    Choice.create(option: value, question_id: question_id)
  end
end
