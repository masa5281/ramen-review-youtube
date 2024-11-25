class RamenShop < ApplicationRecord
  has_many :reviews, dependent: :destroy # ラーメン店は複数のレビューを持てる。ラーメン店が削除されたらreviewも一緒に削除。
end
