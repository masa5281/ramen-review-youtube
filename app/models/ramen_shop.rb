class RamenShop < ApplicationRecord
  has_many :reviews, dependent: :destroy # ラーメン店は複数のレビューを持てる。ラーメン店が削除されたらreviewも一緒に削除。
  def avg_score
    # selfはRamenShop / ラーメン店に結びついているレビューが空ではなかったら以下を返す。
    unless self.reviews.empty?
      reviews.average(:score).round(1).to_f
    else
      0.0
    end
  end
  def review_score_percentage
    # selfはRamenShop / ラーメン店に結びついているレビューが空ではなかったら以下を返す。
    unless self.reviews.empty?
      reviews.average(:score).round(1).to_f * 100 / 5
    else
      0.0
    end
  end
end
