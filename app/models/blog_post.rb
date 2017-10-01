# == Schema Information
#
# Table name: blog_posts
#
#  id         :integer          not null, primary key
#  title      :text
#  content    :text
#  posted_at  :datetime
#  slug       :string
#  admin_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class BlogPost < ApplicationRecord
  belongs_to :admin
end
