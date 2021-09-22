class Subscription < ApplicationRecord
  belongs_to :customer

  validates :title, presence: true
  validates :price, presence: true, numericality: true
  validates :status, presence: true, numericality: true
  validates :frequency, presence: true, numericality: true
end
