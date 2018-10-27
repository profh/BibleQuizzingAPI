class Question < ApplicationRecord
  belongs_to :question_category
  belongs_to :section
  belongs_to :question_type

  scope :refs, ->(var) { where("question_category_id = 4") }
  scope :memory, ->(var) { where("question_category_id in (2,3)") }
  scope :int_only, ->(var) { where("question_category_id = 1") }
  scope :ma_only, ->(var) { where("question_category_id = 5") }
  scope :int_and_ma, ->(var) { where("question_category_id in (1,5)") }

  scope :for_book, ->(book) { where("book = ?", book) }
  scope :for_verse, ->(book,chapter,verse) { where(book: book, chapter: chapter, verse: verse) }
  scope :for_section, ->(section_id) { where("section_id = ?", section_id) }
  scope :for_section_range, ->(starting, ending) { where("section_id between ? and ?", starting, ending) }
  scope :for_chapter_range, ->(starting, ending) { where("chapter between ? and ?", starting, ending) }

  # only to be used for testing
  scope :alphabetical, -> { order("text") }
  scope :set_size, ->(size) { order("random()").limit(size) }
  
  def self.for_current_year
    current_year_questions = []
    active_section_ids = Section.where(active: true).map(&:id).sort
    active_section_ids.each do |i|
      section_questions = Question.for_section(i).sort_by{|q| q.verse}.to_a
      current_year_questions << section_questions
    end
    
    return current_year_questions.flatten!
  end

end
