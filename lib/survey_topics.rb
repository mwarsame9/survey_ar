class SurveyTopic < ActiveRecord::Base
  has_many(:questions)
  before_save(:capitalize_every_word)

private

  define_method(:capitalize_every_word) do
    self.split(' ').map {|w| w.capitalize }.join(' ')
  end

end
