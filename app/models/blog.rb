class Blog < ApplicationRecord
  has_many :articles, -> { order(id: :desc) }, dependent: :destroy, inverse_of: :blog
  accepts_nested_attributes_for :articles, reject_if: :all_blank
  MAX_ARTICLES = 2

  validates :title, presence: true
  validate ->(blog) {
    errors.add(:base, "Articleの#{MAX_ARTICLES + 1}個以上は登録できません") if blog.articles.length > MAX_ARTICLES
  }

  validate ->(blog) {
    # TODO:blog.articlesが参照できない
    if blog.articles.map(&:title).include?(blog.title)
      errors.add(:title, 'blogタイトルとarticleタイトルが同じではいけない')
    end
  }

  def build_articles
    (MAX_ARTICLES - articles.length).times do
      articles.build
    end
  end
end
