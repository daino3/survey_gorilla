50.times do
  User.create(username: Faker::Name.name, email: Faker::Internet.email, password: "123", password_confirmation: "123") #make users
end

#TESTS in rake console
#User.last


150.times do
  User.find(rand(1..50)).createdsurveys << Survey.create(title: Faker::Lorem.words(num = 3, supplemental = false).join(" "))#), url: random_string) 
end

#User.last.surve

450.times do 
  #putting questions in each survey - at random
  Survey.find(rand(1..150)).questions << Question.create(prompt: Faker::Lorem.sentence(word_count = 4, supplemental = false, random_words_to_add = 3))
end

1.upto(150) do |i|
  Survey.find(i).questions.each do |question|
      choices = [Faker::Lorem.words(num = 3, supplemental = false).join(" "),Faker::Lorem.words(num = 3, supplemental = false).join(" "),Faker::Lorem.words(num = 3, supplemental = false).join(" "),Faker::Lorem.words(num = 3, supplemental = false).join(" ")].sample(rand(2..4))
      choices.each do |choice|
        Choice.create(question_id: question.id, option: choice )
      end
    end
end


1000.times do
  takensurveys = Survey.find(rand(1..150)).takensurveys << Takensurvey.create(user_id: rand(1..50), survey_id: rand(1..150))
  survey = Survey.find(takensurveys.last.survey_id)
    survey.questions.each do |question|
      choices = Question.find(question.id).choices
      choices.each do |choice|
      Response.create(choice_id: choice.id, user_id: rand(1..50))
    end
  end
end


# user = User.create(username: "Henry", email:"henry@henry.com", password: "bonmyt", password_confirmation:"bonmyt")
# henry_survey = Survey.create(title: "Henry's Survey", creator_id: user.id)




