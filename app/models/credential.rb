class Credential < ApplicationRecord
  belongs_to :user
  belongs_to :role
  belongs_to :company
end
