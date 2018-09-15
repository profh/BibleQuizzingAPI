class QuizSection < ApplicationRecord
  belongs_to :quiz
  belongs_to :section
end
