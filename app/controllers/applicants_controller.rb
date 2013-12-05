class ApplicantsController < ApplicationController
  
  def index
    @applicants = Applicant.paginate(page: params[:page])
  end

  def show
  	@applicant = Applicant.find(params[:id])
  end

  def new
  	@applicant = Applicant.new
  end

  def create
    @applicant = Applicant.new(applicant_params)
    if @applicant.save
      flash[:success] = "Thank you for applying!"
      redirect_to applicants_path
    else
      render 'new'
    end
  end
    
  private

  	def applicant_params
  		params.require(:applicant).permit(:first_name, :last_name, :street, :city, :state, :zip, :phone, :email, :position, :employed, :salary, :education, :skills)
  	end
end
