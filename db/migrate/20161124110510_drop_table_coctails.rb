class DropTableCoctails < ActiveRecord::Migration[5.0]
  def change
    drop_table :coctails
  end
end
