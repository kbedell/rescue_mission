class Answer < ActiveRecord::Base
  belongs_to :question

  validates :answer, presence: true, length: {minimum: 50}
  validates :answer_giver, presence: true
  validates :question_id, presence: true, numericality: true
end
