class RemoveOwnerFromTransaction < ActiveRecord::Migration[6.0]
  def change

    remove_column :transactions, :owner, :string
  end
end
