class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_max_answer, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def validate_max_answer
    errors.add(:question) if question.answers.count > 3
  end
end
