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
#  container  :string
#

class MenuItem < ApplicationRecord
  acts_as_list top_of_list: 0

  default_scope { order(position: :asc) }

  validates :label, presence: true
  validates :slug, presence: true
  validates :container, presence: true
  validate :slug_is_relative_or_absolute

  def slug_is_relative_or_absolute
    return true if slug.to_s.first == '/'
    return true if slug.to_s[0..3] == 'http'
    self.errors[:slug] << 'must begin with \'/\' or \'http\''
  end
end
