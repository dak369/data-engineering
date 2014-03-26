class Purchaser < ActiveRecord::Base

  belongs_to :dataset
  validates :dataset, presence: true

  has_many :purchases

  validates :name, presence: true, uniqueness: { scope: :dataset }

  # Compute the gross revenue of this Purchaser
  def gross_revenue
    purchases.to_a.sum(&:gross_revenue)
  end
end
