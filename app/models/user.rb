class User < ActiveRecord::Base
  has_many :createdsurvey, class_name:"Survey", foreign_key: :creator_id
  has_many :takensurvey
  has_many :responses, through: :takensurveys
  has_secure_password  
end
