class GigsController < ApplicationController

  def index
    @gigs = Gig.all.order("created_at desc").page(params[:page]).per(25)
  end

  def show
    @gig = Gig.find(params[:id])
    @proposals = @gig.proposals.order("created_at DESC")
    @awarded_proposal = Proposal.where(id: @gig.awarded_proposal).first
  end

  def new
    @gig = Gig.new
  end

  def create
    @gig = Gig.new(gig_params)
    if @gig.save
      redirect_to @gig
    else
      render "new"
    end
  end

  def update
    @gig = Gig.find(params[:id])
    @gig.update(gig_params)
    redirect_to @gig
  end

  def search
    @gigs = Gig.search(params).page(params[:page]).per(25)
  end

  private
    def gig_params
      params.require(:gig).permit(:name, :location, :description, :budget, :category_id, :skill_list, :awarded_proposal)
    end
end
