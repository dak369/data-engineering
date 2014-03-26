require 'csv'

class Dataset < ActiveRecord::Base

  belongs_to :user
  validates :user, presence: true

  validates :name, presence: true

  has_many :merchants
  has_many :purchasers

  def self.upload(user, uploaded_io)
    dataset = self.new({user: user, name: uploaded_io.original_filename})
    dataset.save!

    CSV.parse(uploaded_io.read, col_sep: "\t", headers: true, return_headers: false) do |row|
      purchaser_name = row[0]
      item_description = row[1]
      item_price = Float(row[2])
      purchase_count = Integer(row[3])
      merchant_address = row[4]
      merchant_name = row[5]

      purchaser = dataset.purchasers.find_by_name(purchaser_name) || dataset.purchasers.create!(name: purchaser_name)
      merchant = dataset.merchants.find_by_name(merchant_name) || dataset.merchants.create!(name: merchant_name, address: merchant_address)
      item = dataset.items.find_by_description(item_description) || dataset.items.create!(description: item_description, price: item_price)

      dataset.purchases.create!(purchaser: purchaser, merchant: merchant, item: item, count: purchase_count)
    end

    true
  end
end
