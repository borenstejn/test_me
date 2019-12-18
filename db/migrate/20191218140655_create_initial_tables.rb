class CreateInitialTables < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.string  :owner,   limit: 191, null: false
      t.integer :amount,  default: 0, null: false
      t.string  :label,   limit: 191
      t.text    :additional_infos
    end

    create_table :flurbos do |t|
      t.string  :owner, limit: 191, null: false
      t.integer :total, null: false
    end
  end
end
