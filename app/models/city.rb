class City < ApplicationRecord
  has_many :entries, dependent: :destroy
  has_many :users, through: :entries

  def to_param
    "#{id} #{city}".parameterize
  end
end
