class Product < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name      :string
    timestamps
  end

  has_many :devices, :through => :product_devices
  has_many :product_devices, :dependent => :destroy

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
