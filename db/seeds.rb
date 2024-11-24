# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

RamenShop.create(name: "らぁ麺 飯田商店")
RamenShop.create(name: "Ramen FeeL")
RamenShop.create(name: "中華蕎麦 とみ田")
RamenShop.create(name: "ジャパニーズ ラーメン 五感")