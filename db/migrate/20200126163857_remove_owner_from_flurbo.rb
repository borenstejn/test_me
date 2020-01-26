class RemoveOwnerFromFlurbo < ActiveRecord::Migration[6.0]
  def change

    remove_column :flurbos, :owner, :string
  end
end
