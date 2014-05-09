class AddSecondaryToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :secondary, :boolean, default: false
  end
end
