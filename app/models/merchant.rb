class Merchant < ActiveRecord::Base

  belongs_to :dataset
  validates :dataset, presence: true

  validates :name, presence: true
  validates :address, presence: true
end
