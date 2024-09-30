class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path, notice: "Producto creado con éxito."
    else
      render :nre
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :stock)
  end
end
