class Role < ApplicationRecord
  belongs_to :company

  has_many :credentials
  has_many :users, through: :credentials

  # TODO: Add something like this to avoid creation of aliases of default roles
  # validates_format_of :name, with:/\A(?!Admin|Administrator|Guest)[a-z]+\z/

  default_scope { where(company_id: Company.current_id) }
end
