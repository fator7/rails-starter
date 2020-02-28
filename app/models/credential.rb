class Credential < ApplicationRecord
  belongs_to :user
  belongs_to :role
  belongs_to :company

  default_scope { where(company_id: Company.current_id) }
end
