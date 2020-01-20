class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :clients, dependent: :destroy
  has_many :budgets, through: :clients
  has_many :invoices, through: :clients
  #TODO: Add Invoice
  has_many :line_items, through: :budgets

  def full_name
    first_name + ' ' + last_name
  end
end
