class AddCompletedToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :completed, :boolean, default: false, null: false, after: :title
  end
end
