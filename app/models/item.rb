class Item < ActiveRecord::Base

  belongs_to :merchant
  validates :merchant, presence: true

  validates :description, presence: true, uniqueness: { scope: :merchant }
  validates :price, presence: true, numericality: { greater_than_or_equal_to:  0 }
end
