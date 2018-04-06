module HasSlug
  extend ActiveSupport::Concern

  included do
    before_validation :set_slug_if_empty
    before_validation :remove_leading_slash_from_slug

    validates_presence_of :title, :slug
    validates_uniqueness_of :slug
  end

  def set_slug_if_empty
    if self.slug.empty?
      self.slug = self.title.parameterize
    end
  end

  def remove_leading_slash_from_slug
    if self.slug.present? and self.slug.first == '/'
      self.slug = self.slug[1..-1]
    end
  end
end
