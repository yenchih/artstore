class AddPhotosToProduct < ActiveRecord::Migration
  def change
	  create_table :photos do |t|
      t.integer :product_id
      t.string  :avatar
      t.timestamps
    end
  end
end
