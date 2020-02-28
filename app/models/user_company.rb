class UserCompany < ApplicationRecord
  self.table_name = 'users_companies'

  belongs_to :user
  belongs_to :company

  validates_presence_of :user, :company

  after_create :assign_credentials

  def assign_credentials
    admin = Role.find_by(company_id: company.id, name: 'Administrator')
    guest = Role.find_by(company_id: company.id, name: 'Guest')
    Credential.create(role: admin, company: company, user: user)
    Credential.create(role: guest, company: company, user: user)
  end
end
