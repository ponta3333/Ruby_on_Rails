class ChangeDataImageIdToPostImage < ActiveRecord::Migration[5.2]
  def change
  	change_column :post_images, :image_id, :string
  end
end
