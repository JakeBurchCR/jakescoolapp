class AddColorToNotebooks < ActiveRecord::Migration[5.2]
  def change
    add_column :notebooks, :color, :string
  end
end
