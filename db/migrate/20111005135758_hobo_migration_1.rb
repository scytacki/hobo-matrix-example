class HoboMigration1 < ActiveRecord::Migration
  def self.up
    create_table :devices do |t|
      t.string   :name
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :products do |t|
      t.string   :name
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :product_devices do |t|
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :product_id
      t.integer  :device_id
    end
    add_index :product_devices, [:product_id]
    add_index :product_devices, [:device_id]
  end

  def self.down
    drop_table :devices
    drop_table :products
    drop_table :product_devices
  end
end
