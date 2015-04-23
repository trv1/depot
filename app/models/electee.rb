class Electee < ActiveRecord::Base
  belongs_to :user
  has_many :items
  
  def add_item_electee(p)
    item = items.where(product_id: p.id).first
    unless item
      item = self.items.build(product: p, price: p.price)
    end
    item.save
  end
end
