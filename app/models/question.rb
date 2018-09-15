class Question < ApplicationRecord
  belongs_to :question_category
  belongs_to :section
  belongs_to :question_type

  scope :in_section, ->(section_id) { where("section_id = ?", section_id) }
  scope :in_book, ->(book) { where("book = ?", book) }
  scope :in_chapter, ->(chapter) { where("chapter = ?", chapter) }
  scope :in_verse, ->(verse) { where("verse = ?", verse) }
  scope :for_type, ->(question_type_id) { where("question_type = ?", question_type_id) }
  scope :for_difficulty_ranking, ->(difficulty_ranking) { where("difficulty_ranking = ?", difficulty_ranking) }

end
