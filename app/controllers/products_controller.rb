class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_active_admin_user!, only: :home

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(products_params)
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def index
    @products = Product.all.page(params[:page])
  end
  
  def show
  end  

  def destroy
    @product.destroy
    redirect_to products_path
  end

  def edit
  end

  def update
    @product.update(products_params)
    redirect_to products_path
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def products_params
    params.require(:product).permit(:name, :category_id)
  end
end