class AddTokenIndexToCodeReview < ActiveRecord::Migration
  def change
    add_index(:code_reviews, :token, unique: true)
  end
end
