class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :city

  validates :title, presence: true, length: { maximum: 200, allow_nil: false, message: "Can't be nil" }
  validates :description, presence: true

  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]
  def should_generate_new_friendly_id?
    title_changed? || super
  end

end
