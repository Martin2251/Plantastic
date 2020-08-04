class ChangeColumnOnReviews < ActiveRecord::Migration[6.0]
  def change
    remove_column :reviews, :content, :string
    add_column :reviews, :comment, :string
  end
end
