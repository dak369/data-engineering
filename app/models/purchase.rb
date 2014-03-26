class Purchase < ActiveRecord::Base

  belongs_to :dataset
  validates :dataset, presence: true

  belongs_to :purchaser
  validates :purchaser, presence: true

  belongs_to :merchant
  validates :merchant, presence: true

  belongs_to :item
  validates :item, presence: true

  validates :count, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
