class WorkType < ApplicationRecord
  has_many :questions, dependent: :destroy
end
