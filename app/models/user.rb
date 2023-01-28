class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  # re-write password to check you enter same, for this password field type must be digest
  has_secure_password
end
