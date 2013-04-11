class AddTokenToCodeReview < ActiveRecord::Migration
  def change
    add_column :code_reviews, :token, :string
  end
end
