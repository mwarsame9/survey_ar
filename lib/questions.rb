class Question < ActiveRecord::Base
  belongs_to(:survey_topic)
end
