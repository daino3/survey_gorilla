class Survey < ActiveRecord::Base
  belongs_to :creator, class_name: "User", primary_key: :id
  has_many :questions
  has_many :takensurveys #through: ?  :takensurveys
end
