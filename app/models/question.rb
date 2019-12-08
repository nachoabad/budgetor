class Question < ApplicationRecord
  belongs_to :sector
  has_many :choices, dependent: :destroy

  default_scope {order :position}
end
