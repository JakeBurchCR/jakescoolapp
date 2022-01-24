class AddUserRefToNotebooks < ActiveRecord::Migration[5.2]
  def change
    add_reference :notebooks, :user, foreign_key: true
  end
end
