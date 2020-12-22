class Test < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :questions

  scope :easy, -> { by_level(0..1) }
  scope :medium, -> { by_level(2..4) }
  scope :hard, -> { by_level(5..Float::INFINITY) }

  scope :by_level, -> (level) { where(level: level) }

  scope :by_category, -> (category) { joins(:category).where(categories: { title: category }) }

  def self.ordered_test_titles_by_category(category)
    Test.by_category(category).order(title: :desc).pluck(:title)
  end
end
