class CreateAiReviews < ActiveRecord::Migration[8.0]
  def change
    create_table :ai_reviews do |t|
      t.references :post, null: false, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
