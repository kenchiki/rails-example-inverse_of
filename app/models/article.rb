class Article < ApplicationRecord
  belongs_to :blog, inverse_of: :articles
  accepts_nested_attributes_for :blog
  validates :title, :description, presence: true
  validate ->(article) {
    if article.blog.title == article.title
      errors.add(:title, 'blogタイトルとarticleタイトルが同じではいけない')
    end
  }

end
