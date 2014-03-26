class Purchaser < ActiveRecord::Base

  belongs_to :dataset
  validates :dataset, presence: true

  has_many :purchases

  validates :name, presence: true, uniqueness: { scope: :dataset }
end
