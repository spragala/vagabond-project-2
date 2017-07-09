class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :city
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]
  def should_generate_new_friendly_id?
    title_changed? || super
  end
end
