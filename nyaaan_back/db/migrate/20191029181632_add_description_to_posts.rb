class AddDescriptionToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :description, :string, after: :completed
  end
end
