class Company < ApplicationRecord
  validates_presence_of :subdomain, :name
  validates_uniqueness_of :subdomain
  validates_format_of :subdomain, with:/\A(?!admin|www|private|public)[a-z]+\z/

  def self.current_id=(id)
    Thread.current[:tenant_id] = id
  end

  def self.current_id
    Thread.current[:tenant_id]
  end
end
