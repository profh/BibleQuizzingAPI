# require 'api_constraints'

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope module: 'api' do
    # namespace :v0 do
    #   resources :year_books
    #   resources :users
    #   resources :user_roles
    #   resources :sections
    #   resources :roles
    #   resources :quizzes
    #   resources :quiz_years
    #   resources :quiz_sections
    #   resources :quiz_questions
    #   resources :events
    #   resources :question_types
    #   resources :question_categories
    #   resources :questions
    # end

    namespace :v1 do
      # constraints: ApiConstraints.new(version: 1, default: true) do
        get 'year_questions/', to: 'api#get_questions_for_year', as: :get_year_questions
        get 'questions/', to: 'api#get_questions', as: :get_questions
        get 'sections/', to: 'api#get_sections', as: :get_sections
        get 'books/', to: 'api#get_books', as: :get_books
        get 'sets/', to: 'api#get_questions_for_sections', as: :get_sets
        resources :questions
      # end

    end
  end

end
