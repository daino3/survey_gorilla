class Choice < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :question
  has_many :responses, dependent: :delete_all
end
