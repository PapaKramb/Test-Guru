class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_max_answer

  scope :correct, -> {where(correct: true)}

  private

  def validate_max_answer
    errors.add(:question) if answers.count > 4
  end
end
