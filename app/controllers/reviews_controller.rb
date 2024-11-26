class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def index
    @ramen_shop = RamenShop.find(params[:ramen_shop_id]) # 1つ分のラーメン店
    @reviews = @ramen_shop.reviews # @ramen_shopに紐づいているreviewを全て取得
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to ramen_shop_reviews_path(@review.ramen_shop)
    else
      @ramen_shop = RamenShop.find(params[:id])
      render "ramen_shops/show" # renderの際はアクションを返さない → 変数が足りているかを確認する
    end
  end

  private
  def review_params
    # user_idはビューから送られてこない
    params.require(:review).permit(:ramen_shop_id, :score, :content)
  end
end
