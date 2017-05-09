class SurveyTopic < ActiveRecord::Base
  has_many(:questions)
  before_save(:capitalize_title)

# private

  def capitalize_title
    topic_array = topic.split()
    topic_array.each do |w|
      w.capitalize!
    end
    self.topic = topic_array.join(' ')
  end
end
