class Question < ActiveRecord::Base
  belongs_to(:survey_topic)
  validates(:question, {:presence => true, :length => { :minimum => 10, :maximum => 150 }})
end
