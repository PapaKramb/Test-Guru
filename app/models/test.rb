class Test < ApplicationRecord
  belongs_to :author, class_name: "User", optional: true
  belongs_to :category
  has_many :questions, dependent: :destroy
  has_many :completed_tests, dependent: :destroy # Не совсем понимаю, нужна ли эта связь, когда уже есть связь ниже?
  has_many :users, through: :completed_tests

  validates :title, uniqueness: true, presence: true
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, presence: true

  scope :easy, -> {where(level: 0..1)}
  scope :medium, -> {where(level: 2..4)}
  scope :hard, -> {where(level: 5..Float::INFINITY)}

  scope :by_category, ->(category) {joins(:category).where(categories: {title: category}).order(title: :desc).pluck(:title)}

  def self.title_tests_categories(category)
    by_category(category)
  end
end
