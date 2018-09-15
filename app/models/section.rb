class Section < ApplicationRecord

  scope :for_book, ->(book) { where("book = ?", book) }
  scope :for_chapter, ->(chapter) { where("chapter = ?", chapter) }
  scope :for_verses, ->(start_verse, end_verse) { where("start_verse = ? && start_verse = ?", start_verse, end_verse) }

end
