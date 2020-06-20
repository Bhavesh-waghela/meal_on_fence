class AddAttachmentAvatarToFoodItems < ActiveRecord::Migration[5.1]
  def self.up
    change_table :food_items do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :food_items, :avatar
  end
end
