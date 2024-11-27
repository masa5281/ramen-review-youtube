class Review < ApplicationRecord
  # model作成の際にreferences型を指定していると自動で記述される。
  belongs_to :user # 1つのreviewレコード（レビュー）は1人のユーザーによって作成される
  belongs_to :ramen_shop # 1つのreviewレコードは1つのラーメン店に関連している

  validates :score, presence: true
end
