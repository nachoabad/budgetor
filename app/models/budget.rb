class Budget < ApplicationRecord
  belongs_to :client
  has_many :line_items, as: :line_itemable, dependent: :destroy

  enum status: [ :created, :sent, :approved ]
end