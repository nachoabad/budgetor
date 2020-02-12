class LineItem < ApplicationRecord
  belongs_to :line_itemable, polymorphic: true

  default_scope {order :id}
end
