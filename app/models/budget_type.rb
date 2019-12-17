class BudgetType < ApplicationRecord
  has_many :questions, dependent: :destroy
end
