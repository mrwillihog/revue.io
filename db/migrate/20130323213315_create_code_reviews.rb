class CreateCodeReviews < ActiveRecord::Migration
  def change
    create_table :code_reviews do |t|
      t.text :raw

      t.timestamps
    end
  end
end
