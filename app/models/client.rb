class Client < ApplicationRecord
  belongs_to :user
  has_many :budgets, dependent: :destroy

   def full_name
    first_name + ' ' + last_name
  end
end
