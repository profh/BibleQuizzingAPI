class Api::V0::QuestionTypeSerializer < ActiveModel::Serializer
  attributes :id, :name, :question_category
end
