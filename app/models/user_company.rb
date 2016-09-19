class UserCompany < ApplicationRecord
  self.table_name = 'users_companies'

  belongs_to :user
  belongs_to :company

  validates_presence_of :user, :company

  after_create :assign_credentials

  def assign_credentials
    role = Role.find(company: company, name: 'Administrator')
    role = Role.find(company: company, name: 'Guest')
    Credential.create(role: role, company: company, user: user)
  end
end
