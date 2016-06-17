class Gig < ActiveRecord::Base
  belongs_to :user
  has_many :proposals
  has_many :abitilies
  has_many :skills, through: :abilities
  belongs_to :category

  geocoded_by :location
  after_validation :geocode

  def self.search(params)
    gigs = Gig.where("name like ? or description like?", "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?

  end
end
