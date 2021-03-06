class CompletedTestsController < ApplicationController
  
  before_action :authenticate_user!
  before_action :set_completed_test, only: %i[show update result]

  def show; end

  def result; end

  def update
    @completed_test.accept!(params[:answer_ids])
    
    if @completed_test.completed?
      TestsMailer.completed_test(@completed_test).deliver_now
      BadgeService.call(@completed_test)
      redirect_to result_completed_test_path(@completed_test)
    else
      render :show
    end
  end

  private

  def set_completed_test
    @completed_test = CompletedTest.find(params[:id])
  end

end
