class Review < ApplicationRecord
  belongs_to :user # 1つのreviewレコードは1人のユーザーに属する
  belongs_to :ramen_shop # 1つのreviewレコードは1つのラーメン店に属する
end
