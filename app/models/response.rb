class Response < ActiveRecord::Base
  # Remember to create a migration!
    belongs_to :choice
    belongs_to :takensurvey
    belongs_to :user, through: :takensurvey
end
