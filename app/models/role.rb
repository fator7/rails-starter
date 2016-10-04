class Role < ApplicationRecord
  belongs_to :company

  has_many :credentials
  has_many :users, through: :credentials

  default_scope { where(company_id: Company.current_id) }
end
