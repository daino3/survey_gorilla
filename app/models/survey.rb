class Survey < ActiveRecord::Base
  belongs_to :creator, class_name: "User", primary_key: :id
  has_many :questions, :dependent => :delete_all
  has_many :takensurveys, :dependent => :delete_all
  has_one :photo, :dependent => :delete
  has_many :responses, through: :takensurveys
end
