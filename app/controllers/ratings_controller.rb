class RatingsController < ApplicationController

  def index
    @ratings = Rating.paginate(page: params[:page])
  end 

  def show
    @rating = Rating.find(params[:id])
  end

  def new
    @rating = Rating.new
  end

  def create
     @rating = Rating.new(rating_params)
    if @rating.save
      flash[:success] = "You have just Rated this App!"
      redirect_to rate_path
    else
      render 'new'
    end
  end 

  private

    def rating_params
      params.require(:rating).permit(:rating, :content)
    end
end