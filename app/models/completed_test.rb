class CompletedTest < ApplicationRecord
  SUCCESS = 85.0

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_current_question

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)

    save!
  end

  def completed?
    current_question.nil?
  end

  def test_result
    (correct_questions.to_f / test.questions.count * 100).round(2)
  end

  def test_passed?
    test_result >= SUCCESS
  end

  def current_question_number
    test.questions.index(current_question).to_i + 1
  end

  def questions_count
    test.questions.count
  end

  private

  def correct_answers
    current_question.answers.correct
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == Array(answer_ids).map(&:to_i).sort
  end

  def next_question
    if current_question
      test.questions.where('id > ?', current_question.id).first
    else
      test.questions.first
    end
  end

  def before_validation_set_current_question
    self.current_question = next_question
  end

end
