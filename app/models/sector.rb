class Sector < ApplicationRecord
  has_many :questions, dependent: :destroy
end
