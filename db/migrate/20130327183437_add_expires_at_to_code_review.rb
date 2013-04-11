class AddExpiresAtToCodeReview < ActiveRecord::Migration
  def change
    add_column :code_reviews, :expires_at, :datetime
  end
end
