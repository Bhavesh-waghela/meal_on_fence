class CreateFoodItems < ActiveRecord::Migration[5.1]
  def change
    create_table :food_items do |t|
      t.string :title
      t.string :food_type
      t.text :description

      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
