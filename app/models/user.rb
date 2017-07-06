class User < ApplicationRecord
  include Clearance::User

  include Clearance::User
  has_many :entries, dependent: :destroy
  has_many :cities, through: :entries
end
