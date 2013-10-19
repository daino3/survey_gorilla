class Takensurvey < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :survey
  has_many :questions, through: :survey
  has_many :responses, through: :questions
end
