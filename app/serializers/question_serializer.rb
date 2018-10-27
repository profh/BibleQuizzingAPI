  class QuestionSerializer
    include FastJsonapi::ObjectSerializer

    attributes :id, :text, :answer, :bcv_reference, :question_type


    attribute :bcv_reference do |object|
      "#{object.book} #{object.chapter}:#{object.verse}"
    end

    attribute :question_type do |object|
      case object.question_type.id
      when 1
        "INT"
      when 2
        "FTV"
      when 3
        "FT"
      when 4
        "F2V"
      when 5
        "FTN"
      when 6
        "Q"
      when 7
        "Q2V"
      when 8
        "CR"
      when 9
        "CVR"
      when 10
        "CRMA"
      when 11
        "CVRMA"
      when 12
        "MA"
      else
        "SIT"
      end
      
    end

  end
