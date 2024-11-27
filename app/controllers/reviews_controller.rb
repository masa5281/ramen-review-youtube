class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def index
    @ramen_shop = RamenShop.find(params[:ramen_shop_id]) # 1つ分のラーメン店 / 特定のramen_shopを取得（紐づいているレビューを取得するため（下のコードの準備））
    @reviews = @ramen_shop.reviews # @ramen_shopに紐づいているreviewを全て取得
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to ramen_shop_reviews_path(@review.ramen_shop) # 保存に成功したら@reviewに紐づいているramen_shopオブジェクト → ルーティングヘルパーはオブジェクトを渡すと自動的にそのidを取得できる（@review.ramen_shop.id）
    else
      @ramen_shop = RamenShop.find(params[:id])
      render "ramen_shops/show" # renderの際はアクションを返さない → 変数の定義が足りているかを確認する。
    end
  end

  private
  def review_params
    # user_idはビューから送られてこない
    params.require(:review).permit(:ramen_shop_id, :score, :content)
  end
end
