class ReviewsController < ApplicationController

  before_action :ensure_logged_in
  before_action :load_review, only: [:edit, :update, :destroy]
  before_action :ensure_user_owns_review

  def create
    @review = Review.new
    @product = Product.find(params[:product_id])
    @review.product_id = params[:product_id]
    @review.description = params[:review][:description]
    @review.user = current_user
    if @review.save
      flash[:notice] = "Review saved !"
      redirect_to "/products/#{@review.product_id}"
    else
      @product = Product.find(params[:product_id])
      render "products/show"
    end
  end

  def edit
    @product = Product.find(params[:product_id])
  end

  def update
    @review.product_id = params[:product_id]
    @review.description = params[:review][:description]
    if @review.save
      flash[:notice] = "Review updated !"
      redirect_to "/products/#{@review.product_id}"
    else
      @product = Product.find(params[:product_id])
      render "products/show"
    end
  end

  def destroy
    @product = Product.find(params[:product_id])
    @review.destroy
    if @review.destroy
    redirect_to "/products/#{@product.id}"
    end
  end

  def load_review
    @review = Review.find(params[:id])
  end

  def ensure_user_owns_review
    unless current_user == @review.user
      flash[:alert] = "Please log in"
      redirect_to new_session_url
    end
  end

end
