class AddUserReferencesToFlurbos < ActiveRecord::Migration[6.0]
  def change
    add_reference :flurbos, :user, null: false, foreign_key: true
  end
end
