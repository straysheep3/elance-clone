class Gig < ActiveRecord::Base
  belongs_to :user
  has_many :proposals
  has_many :abitilies
  has_many :skills, through: :abilities
  belongs_to :category
end
