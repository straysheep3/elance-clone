class GigsController < ApplicationController

  def index
    @gigs = Gig.all.order("created_at desc").page(params[:page]).per(25)
  end

  def show
    @gig = Gig.find(params[:id])
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


  private
    def gig_params
      params.require(:gig).permit(:name, :location, :description, :budget)
    end
end
