class Test < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: "user_id"
  belongs_to :category
  has_many :questions, dependent: :destroy
  has_many :completed_tests, dependent: :destroy
  has_many :users, through: :completed_tests

  validates :title, uniqueness: { scope: :level }, presence: true
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, presence: true

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  scope :by_level, ->(level) { where(level: level) }
  scope :by_category, ->(category) { joins(:category).where(categories: {title: category}) }

  def self.title_tests_categories(category)
    by_category(category).order(title: :desc).pluck(:title)
  end
end
