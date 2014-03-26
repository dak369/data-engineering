class Merchant < ActiveRecord::Base

  belongs_to :dataset
  validates :dataset, presence: true

  has_many :items

  validates :name, presence: true, uniqueness: { scope: :dataset }
  validates :address, presence: true
end
