class AnswersController < ApplicationController
  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question = @question
    if @answer.save
      redirect_to question_path(@question)
    else
      @answers = @question.answers
      render template: "questions/show"
    end
  end

  private
  def answer_params
    params.require(:answer).permit(:answer, :answer_giver)
  end
end
