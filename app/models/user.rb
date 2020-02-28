class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User

  has_many :users_companies
  has_many :companies, through: :users_companies

  has_many :credentials
  has_many :roles, through: :credentials
end
