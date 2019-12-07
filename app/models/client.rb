class Client < ApplicationRecord
  belongs_to :user
  has_many :budgets, dependent: :destroy
end
