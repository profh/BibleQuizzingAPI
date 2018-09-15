class Api::V1::SectionSerializer < ActiveModel::Serializer
  attributes :id, :book, :chapter, :start_verse, :end_verse, :active
end
