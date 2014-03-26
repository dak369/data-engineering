class Dataset < ActiveRecord::Base

  belongs_to :user
  validates :user, presence: true

  validates :name, presence: true

  has_many :merchants
  has_many :purchasers
  has_many :items
  has_many :purchases

  def self.upload(user, uploaded_io)
    dataset = self.new({user: user, name: uploaded_io.original_filename})
    dataset.save
  end
end
