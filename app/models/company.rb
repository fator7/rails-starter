class Company < ApplicationRecord
  validates_uniqueness_of :subdomain
  validates_presence_of :subdomain, :name

  def self.current_id=(id)
    Thread.current[:tenant_id] = id
  end

  def self.current_id
    Thread.current[:tenant_id]
  end
end
