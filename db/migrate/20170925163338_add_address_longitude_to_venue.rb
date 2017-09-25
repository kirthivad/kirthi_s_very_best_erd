class AddAddressLongitudeToVenue < ActiveRecord::Migration[5.0]
  def change
    add_column :venues, :address_longitude, :float
  end
end
