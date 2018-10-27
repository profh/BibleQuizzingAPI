Rails.application.routes.draw do

  get 'questions/', to: 'questions#get_questions_for_year', as: :get_year_questions
  
end
