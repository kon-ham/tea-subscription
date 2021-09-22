class Customer < ApplicationRecord
    has_many :subscriptions

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, uniqueness: true, format: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
    validates :address, presence: true
end
