class AddImageSrc < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :img_src, :string
  end
end
