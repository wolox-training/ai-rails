class AddDescriptionToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :description, :text
  end
end
