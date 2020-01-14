class TotalIntoBalance < ActiveRecord::Migration[6.0]
  def change
    rename_column :flurbos, :total, :balance
  end
end
