class Article < ApplicationRecord
  belongs_to :category, foreign_key: "categories_id", optional: true

  enum :status, { draft: "draft", published: "published" }, validate: true

  normalizes :slug, with: ->(slug) { slug.parameterize }

  validates :title, length: { maximum: 120 }
  validates :body, presence: true

  before_save :generate_slug, if: :title_changed?
  before_save :set_published_at

  def self.search(query)
    query = query.to_s.strip
    return all if query.blank?

    where("title LIKE ?", "%#{query}%")
  end

  def to_param
    return super if slug.blank?

    "#{id}-#{slug}"
  end

  private

  def generate_slug
    self.slug = title.to_s.parameterize
  end

  def set_published_at
    self.published_at = Time.current if published?
  end
end
