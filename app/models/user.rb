require 'bcrypt'

class User < ActiveRecord::Base
  has_many :createdsurveys, class_name: "Survey", foreign_key: :creator_id
  has_many :takensurveys, dependent: :delete_all
  has_many :responses, through: :takensurveys
  validates :email, uniqueness: true
  has_secure_password
end
