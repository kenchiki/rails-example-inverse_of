class Article < ApplicationRecord
  belongs_to :blog
  validates :title, :description, presence: true
  validate ->(article) {
    if article.blog.title.include?('blog') && article.title.include?('blog')
      errors.add(:title, 'blogのタイトルにblogという文字が入っていたらarticleのタイトルにblogが
入っていてはいけない')
    end
  }
end
