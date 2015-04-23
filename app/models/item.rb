class Item < ActiveRecord::Base
  belongs_to :product
  belongs_to :electee
  
  validates :product, presence: true
  validates :product_id, uniqueness: {scope: :electee_id}
  validates :electee, presence: true
  validates :price, presence: true
end
