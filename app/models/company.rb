class Company < ApplicationRecord
  validates_presence_of :subdomain, :name
  validates_uniqueness_of :subdomain
  validates_format_of :subdomain, with:/\A(?!admin|www|private|public)[a-z]+\z/

  has_many :users_companies, dependent: :destroy
  has_many :users, through: :users_companies

  has_many :credentials, dependent: :destroy
  has_many :roles, dependent: :destroy, foreign_key: :company_id

  after_create :set_tenant_id, :create_roles

  # Try to avoid this http://stackoverflow.com/a/25087337/1254111
  def set_tenant_id
    Thread.current[:tenant_id] = id
  end

  def self.current_id=(id)
    Thread.current[:tenant_id] = id
  end

  def self.current_id
    Thread.current[:tenant_id]
  end

  def create_roles
    Role.create(name: 'Administrator')
    Role.create(name: 'Guest')
  end

end
