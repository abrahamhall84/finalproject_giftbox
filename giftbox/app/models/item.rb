class Item < ActiveRecord::Base
  belongs_to :user

  validates :product, :give_quantity, :want_quantity, presence: true
end
