class Response < ActiveRecord::Base
  # Remember to create a migration!
    belongs_to :choice
    belongs_to :user
    has_one :question, through: :choice
end
