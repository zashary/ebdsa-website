require 'nokogiri' 

# == Schema Information
#
# Table name: pages
#
#  id                   :integer          not null, primary key
#  title                :text
#  content              :text
#  slug                 :string           not null
#  parent_id            :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  subtitle             :text
#  listed               :boolean          default(TRUE)
#  show_form            :boolean          default(FALSE), not null
#  form_tags            :string
#  background_image_url :string
#  meta_title           :string
#  meta_desc            :string
#  form_collect_phone   :boolean          default(FALSE), not null
#  order                :integer
#  homepage_campaign    :boolean
#  homepage_text        :text
#  homepage_color       :text
#
# Indexes
#
#  index_pages_on_order  (order) UNIQUE
#  index_pages_on_slug   (slug) UNIQUE
#

class Page < ApplicationRecord
  include HasSlug
  has_paper_trail

  attr_accessor :html_content

  scope :listed,                -> { where(listed: true) }
  scope :highlighted_campaigns, -> { where(homepage_campaign: true).order(order: :asc) }

  has_many :subpages, class_name: 'Page', foreign_key: :parent_id
  belongs_to :parent, class_name: 'Page', optional: true

  validates :form_tags, presence: true, if: :show_form?

  alias_attribute :to_param, :slug
  before_validation :check_html_value

  def all_parents
    parents = []
    page = self
    while page.parent
      parents << page.parent
      page = page.parent
    end
    parents
  end

  def home?; slug == 'home'; end

  #
  # HTML Content
  #

  # Allow saving of direct html content if "raw_html" passed
  # This is being added to easier allow email listings and other html sources to be added to the site without edits

  def html_content
    @html_content ||= self.content
  end

  def html_content=(val)
    doc = Nokogiri.HTML(val)
    doc.css('script').remove # Remove any javascript to be safe
    doc.xpath("//@*[starts-with(name(),'on')]").remove # Remove on____ attributes
    @html_content = doc
  end

  def check_html_value
    if raw_html
      self.content = @html_content
    end
  end
end
