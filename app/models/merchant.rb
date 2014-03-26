class Merchant < ActiveRecord::Base

  belongs_to :user
  validates :user, presence: true

  validates :name, presence: true
  validates :address, presence: true
end
