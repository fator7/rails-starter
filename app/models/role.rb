class Role < ApplicationRecord
  belongs_to :company

  has_many :credentials
  has_many :users, through: :credentials
end
