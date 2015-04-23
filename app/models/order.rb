class Order < ActiveRecord::Base
  scope :ordering,->{order(created_at: :desc)}
  STATUSES = %w(Оформлен Подтвержден Доставляется Завершен Отменен)
  belongs_to :cart, ->{includes(:line_items => :product).order(:created_at)}
  belongs_to :user

  validates :cart, presence: true
  validates :user, presence: true
  validates :address, presence: true
  validates :status, presence: true, inclusion: {in: 1..STATUSES.size}

  validate :check_cart

  def check_cart
    if cart && cart.line_items.blank?
      errors.add(:cart, "пуста")
    end
  end
end
