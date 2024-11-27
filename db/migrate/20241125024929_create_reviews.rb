class CreateReviews < ActiveRecord::Migration[7.1]
  # データベーススキーマを変更するための標準的なメソッド
  # このメソッド内でテーブルの構造を定義
  def change 
    # |t| → テーブルの設定を行うブロック変数
    create_table :reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.references :ramen_shop, null: false, foreign_key: true
      t.string :content
      t.integer :score

      t.timestamps
    end
  end
end
