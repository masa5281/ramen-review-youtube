class RamenShop < ApplicationRecord
  has_many :reviews, dependent: :destroy # ラーメン店は複数のレビューを持てる。ラーメン店が削除されたらreviewも一緒に削除。
  
  # ラーメン店に関連付けられたレビューのスコアの平均点を計算し、小数点第1位まで四捨五入した結果を返すメソッド。
  def avg_score
    # selfはRamenShop / ラーメン店に結びついているレビューが空ではなかったら以下を返す。
    unless self.reviews.empty?
      reviews.average(:score).round(1).to_f # selfは暗黙的に省略できる。（本当は：ramen_shop.reviews.averageとなる） / 上の条件式の際はreviewがどこから来ているのか明示的にするため記述している。
    else # レビューがない場合(empty?がtrue)
      0.0
    end
  end
  def review_score_percentage
    unless self.reviews.empty?
      reviews.average(:score).round(1).to_f * 100 / 5
    else
      0.0
    end
  end
end
