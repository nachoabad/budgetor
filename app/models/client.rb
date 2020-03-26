class Client < ApplicationRecord
  belongs_to :user
  has_many :budgets,  dependent: :destroy
  has_many :invoices, dependent: :destroy

   def full_name
    first_name + ' ' + last_name if first_name && last_name
  end
end
