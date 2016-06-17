class Gig < ActiveRecord::Base
  belongs_to :user
  has_many :proposals
  has_many :abitilies
  has_many :skills, through: :abilities
  belongs_to :category

  def self.search(params)
    gigs = Gig.where("name like ? or description like?", "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?

  end
end
