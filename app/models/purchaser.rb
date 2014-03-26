class Purchaser < ActiveRecord::Base

  belongs_to :dataset
  validates :dataset, presence: true

  validates :name, presence: true
end
