def current_user
  @current_user = User.find(session[:user_id]) if session[:user_id]
end

def create_choices(choices_hash, question_id)
  choices_hash.each do |key, value|
    Choice.create(option: value, question_id: question_id)
  end
end

def create_responses(responses_hash, user_id)
  responses_hash.each do |key, value|
    Response.create(choice_id: value, user_id: current_user.id)
  end
end

def time_ago(date)
  date
end
