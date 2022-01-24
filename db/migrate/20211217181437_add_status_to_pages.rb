class AddStatusToPages < ActiveRecord::Migration[5.2]
  def change
    add_column :pages, :status, :string
  end
end
