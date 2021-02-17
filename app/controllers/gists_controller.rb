class GistsController < ApplicationController

  before_action :authenticate_user!
  before_action :find_completed_test, only: :create

  def create
    result = GistQuestionService.new(@completed_test.current_question).call

    if result.present?
      Gist.create!(user: current_user, question_id: @completed_test.current_question.id, url: result.url)
      redirect_to @completed_test, notice: t('.success', url: result.url)
    else
      redirect_to @completed_test, alert: t('.failure')
    end

  end

  private

  def find_completed_test
    @completed_test = CompletedTest.find(params[:completed_test_id])
  end

end
