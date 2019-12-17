class Question < ApplicationRecord
  belongs_to :budget_type
  has_many :choices, dependent: :destroy

  default_scope {order :position}
end
