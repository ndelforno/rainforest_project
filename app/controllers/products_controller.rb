class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @review = Review.new
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new
    @product.name = params[:product][:name]
    @product.description = params[:product][:description]
    @product.price_in_cents = params[:product][:price_in_cents]
    if @product.save
        flash[:notice] = "Product saved !"
       redirect_to '/products'
     else
       render :new
    end

  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.name = params[:product][:name]
    @product.description = params[:product][:description]
    @product.price_in_cents = params[:product][:price_in_cents]
    if @product.save
      flash[:notice] = "Product updated !"
       redirect_to "/products/#{@product.id}"
     else
       render :edit
    end


  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    if @product.destroy
      flash[:notice] = "Product Deleted !"
    redirect_to "/products"
    end
  end
end
