class Item < ActiveRecord::Base

  belongs_to :user
  validates :user, presence: true

  validates :price, presence: true, numericality: { greater_than_or_equal_to:  0 }
end
