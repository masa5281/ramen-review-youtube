class RamenShopsController < ApplicationController
  def index
    # ramen_shopテーブルの全てのレコードを取得
    @ramen_shops = RamenShop.all
  end

  def show
    @ramen_shop = RamenShop.find(params[:id]) # ramen_shopsテーブルからパラメータで送られてきたidと一致するレコードを1件取得。
    @review = Review.new # Reviewモデルの空のインスタンスを参照するために代入。
  end
end
