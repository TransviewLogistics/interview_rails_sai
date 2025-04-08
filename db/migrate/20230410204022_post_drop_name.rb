class PostDropName < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :name
  end
end
