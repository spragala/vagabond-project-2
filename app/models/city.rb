class City < ApplicationRecord
  has_many :entries, dependent: :destroy
  has_many :users, through: :entries

  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]
  def should_generate_new_friendly_id?
    name_changed? || super
  end
end
