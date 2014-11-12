class AddCategoryIdToPosts < ActiveRecord::Migration
  def change
    add_reference :posts, :category_id, index: true
  end
end
