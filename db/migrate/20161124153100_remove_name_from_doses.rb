class RemoveNameFromDoses < ActiveRecord::Migration[5.0]
  def change
    remove_column :doses, :name, :string
  end
end
