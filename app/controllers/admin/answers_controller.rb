class Admin::AnswersController < Admin::BaseController

  before_action :set_answer, only: %i[show edit update destroy]
  before_action :find_question, only: %i[new create]

  def show; end

  def new
    @answer = @question.answers.new
  end

  def edit; end

  def create
    @answer = @question.answers.new(answers_params)

    if @answer.save
      redirect_to admin_answer_path(@answer)
    else
      render :new
    end
  end

  def update
    if @answer.update(answers_params)
      redirect_to admin_answer_path(@answer)
    else
      render :edit
    end
  end

  def destroy
    @answer.destroy!

    redirect_to admin_question_path(@answer.question)
  end

  private

  def set_answer
    @answer = Answer.find(params[:id])
  end

  def find_question
    @question = Question.find(params[:question_id])
  end

  def answers_params
    params.require(:answer).permit(:body, :correct)
  end
end
