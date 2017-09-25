class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.integer :neighborhood_id
      t.string :address

      t.timestamps

    end
  end
end
