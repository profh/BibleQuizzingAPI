class Api::V1::QuestionSerializer < ActiveModel::Serializer
  attributes :id, :text, :answer, :book, :chapter, :verse

  #has_one :section, serializer: Api::V1::SectionSerializer
  has_one :question_type, serializer: Api::V1::QuestionTypeSerializer
  has_one :question_category, serializer: Api::V1::QuestionCategorySerializer

  def text
     "#{object.text.strip}"
  end

end
