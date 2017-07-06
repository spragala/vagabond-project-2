class City < ApplicationRecord
  has_many :entries, dependent: :destroy
  has_many :users, through: :entries
end
