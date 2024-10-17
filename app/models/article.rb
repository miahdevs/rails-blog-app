class Article < ApplicationRecord
  include Visible
  before_validation :generate_slug, on: :create

  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
  validates :slug, presence: true, uniqueness: true

  def to_param
    slug
  end

  private

  def generate_slug
    self.slug = title.parameterize
  end
end
