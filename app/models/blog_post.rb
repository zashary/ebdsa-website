# == Schema Information
#
# Table name: blog_posts
#
#  id             :integer          not null, primary key
#  title          :text
#  content        :text
#  posted_at      :datetime
#  slug           :string           not null
#  author_id      :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  featured_image :string
#  listed         :boolean          default(TRUE)
#  meta_title     :string
#  meta_desc      :string
#  featured       :boolean          default(TRUE), not null
#
# Indexes
#
#  index_blog_posts_on_author_id  (author_id)
#  index_blog_posts_on_slug       (slug) UNIQUE
#

class BlogPost < ApplicationRecord
  include HasSlug
  has_paper_trail

  scope :listed, -> { where(listed: true).order('posted_at DESC') }
  scope :homepage, -> { where(listed: true, featured: true).order('posted_at DESC') }

  belongs_to :author, class_name: 'Admin'
  alias_attribute :to_param, :slug

  def self.ransackable_attributes(auth_object = nil)
    ["author_id", "content", "created_at", "featured", "featured_image", "id", "listed", "meta_desc", "meta_title", "posted_at", "slug", "title", "to_param", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["author", "versions"]
  end

end
