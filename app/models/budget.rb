class Budget < ApplicationRecord
  belongs_to :client
  has_many :line_items
end
