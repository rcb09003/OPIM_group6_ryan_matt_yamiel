class ProductsController < ApplicationController
  def show
  	@product = Product.find(params[:id])
  end

  def new
  	@product = Product.new
  end

  private

  	def product_params
  		params.require(:product).permit(:name, :price)
  	end
end
