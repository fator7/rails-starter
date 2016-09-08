class UserCompany < ApplicationRecord
  self.table_name = 'users_companies'

  belongs_to :user
  belongs_to :company

  validates_presence_of :user, :company
end
