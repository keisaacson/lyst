class List < ActiveRecord::Base
  belongs_to :user
  has_many :items
  has_many :shares
  has_many :users, through: :shares
end
