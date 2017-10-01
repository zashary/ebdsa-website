# == Schema Information
#
# Table name: pages
#
#  id           :integer          not null, primary key
#  title        :text
#  content      :text
#  slug         :string
#  show_in_menu :boolean
#  parent_id    :integer
#  admin_id     :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Page < ApplicationRecord
  belongs_to :parent, class_name: Page
  belongs_to :admin
end