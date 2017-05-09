class SurveyTopic < ActiveRecord::Base
  has_many(:questions)
end
