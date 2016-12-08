class Response < ActiveRecord::Base
  validate :not_duplicate_responce

  belongs_to :user,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :User

  belongs_to :answer_choice,
  primary_key: :id,
  foreign_key: :answer_choice_id,
  class_name: :AnswerChoice

  has_one :question,
  through: :answer_choice,
  source: :question

  def not_duplicate_responce
    if response_already_answered?
      errors[:already] << "answered question"
    end
  end

  def response_already_answered?
    sibling_response.empty? ? false : true
  end

  def sibling_response
    responses = self.question.responses.where.not(id: self.id)
  end
end
