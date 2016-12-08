class Question < ActiveRecord::Base
  validates :body, presence: true

  belongs_to :poll,
    primary_key: :id,
    foreign_key: :poll_id,
    class_name: :Poll

  has_many :answer_choice,
    primary_key: :id,
    foreign_key: :question_id,
    class_name: :AnswerChoice

    has_many :responses,
    through: :answer_choice,
    source: :responses
end
