class AddStatusToNotebooks < ActiveRecord::Migration[5.2]
  def change
    add_column :notebooks, :status, :string
  end
end
