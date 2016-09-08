class Company < ApplicationRecord
  validates_presence_of :subdomain, :name
  validates_uniqueness_of :subdomain
  validates_format_of :subdomain, with:/\A(?!admin|www|private|public)[a-z]+\z/

  has_many :users_companies
  has_many :users, through: :users_companies

  def self.current_id=(id)
    Thread.current[:tenant_id] = id
  end

  def self.current_id
    Thread.current[:tenant_id]
  end
end
