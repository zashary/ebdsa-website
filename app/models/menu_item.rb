# == Schema Information
#
# Table name: menu_items
#
#  id         :integer          not null, primary key
#  label      :string
#  slug       :string
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  container  :integer
#

class MenuItem < ApplicationRecord
  acts_as_list top_of_list: 0
  enum container: [ :header, :footer ]

  default_scope { order(position: :asc) }

  validates :label, presence: true
  validates :slug, presence: true, format: { with: /\A(\/|http).*/i, message: 'must begin with "/" or "http"'}
  validates :container, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["container", "created_at", "id", "label", "position", "slug", "updated_at"]
  end
end
