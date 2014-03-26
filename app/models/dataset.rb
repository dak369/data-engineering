require 'csv'

class Dataset < ActiveRecord::Base

  belongs_to :user
  validates :user, presence: true

  validates :name, presence: true

  has_many :merchants
  has_many :purchasers

  # Create a Dataset by reading from a tab-delimited file
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

      merchant = dataset.merchants.find_by_name(merchant_name) || dataset.merchants.create!(name: merchant_name, address: merchant_address)
      purchaser = dataset.purchasers.find_by_name(purchaser_name) || dataset.purchasers.create!(name: purchaser_name)

      item = merchant.items.find_by_description(item_description) || merchant.items.create!(description: item_description, price: item_price)

      purchaser.purchases.create!(item: item, count: purchase_count)
    end

    dataset
  rescue
    false
  end

  # Return the gross revenue of this Dataset
  def gross_revenue
    purchasers.to_a.sum(&:gross_revenue)
  end
end
