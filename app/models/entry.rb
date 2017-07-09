class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :city
  def to_param
    "#{id} #{title}".parameterize
  end
end
