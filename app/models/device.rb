class Device < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name       :string
    timestamps
  end

  has_many :products, :through => :product_devices, :accessible => true
  has_many :product_devices, :dependent => :destroy

  children :products

  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator?
  end

  def update_permitted?
    acting_user.administrator?
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end

end
