class Question < ApplicationRecord
  belongs_to :work_type
  has_many :choices, dependent: :destroy

  default_scope {order :position}
end
