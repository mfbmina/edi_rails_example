class AddStorageNumberToShipment < ActiveRecord::Migration
  def change
    add_column :shipments, :storage_number, :integer
  end
end
