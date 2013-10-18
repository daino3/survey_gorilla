50.times do
  User.create(username: Faker::Name.name, email: Faker::Internet.email, gender: ["male","female"].sample, password: "123") #make users
end

150.times do
  #this will give a survey a random URL
  random_url_string = (0...8).map { (65 + rand(26)).chr }.join 
  #Assigns created surveys to users
  User.find(rand(1..50)).surveys << Survey.create(title: Faker::Lorem.words(num = 3, supplemental = false).join(" "), url: random_string) 
end

450.times do 
  #putting questions in each survey - at random
  Survey.find(rand(1..150)).questions << Question.create(title: Faker::Lorem.sentence(word_count = 4, supplemental = false, random_words_to_add = 6)
end

1.upto(150) do |i|
  Survey.find(i).questions.each do |question|
      choices = [Faker::Lorem.words(num = 3, supplemental = false).join(" "),Faker::Lorem.words(num = 3, supplemental = false).join(" "),Faker::Lorem.words(num = 3, supplemental = false).join(" "),Faker::Lorem.words(num = 3, supplemental = false).join(" ")].sample(rand(2..4))
      choices.each do |choice|
        Choice.create(title: choice, question_id: question.id)
      end
    end
  end
end


1000.times do
  takensurveys = Survey.find(rand(1..150)).takensurveys << takensurveys.create(user_id: rand(1..150), gender: ["male","female"].sample, age: rand(18..65))
  survey = Survey.find(takensurveys.last.survey_id)
    survey.questions.each do |question|
      choices = Question.find(question.id).choices
      Response.create(takensurveys_id: takensurveys.last.id, question_id: question.id, answer: Faker::Lorem.words(num = 3, supplemental = false).join(" "))
  end
end

