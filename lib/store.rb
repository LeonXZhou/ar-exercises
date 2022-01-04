class Store < ActiveRecord::Base
  has_many :employees
  validates :name, length: {minimum: 3}
  validates :annual_revenue, numericality: { greater_than: 0 }
  validate :must_have_clothing
  def must_have_clothing
    if !mens_apparel && !womens_apparel
      errors.add(:mens_apparel, "must have atleast one type of clothing")
      errors.add(:womens_apparel, "must have atleast one type of clothing")
    end
  end
end
