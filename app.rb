require('sinatra')
require('sinatra/reloader')
require('sinatra/activerecord')
also_reload('lib/**/*.rb')
require('./lib/questions')
require('./lib/survey_topics')
require('pg')
require('pry')

get('/') do
  @survey_topics = SurveyTopic.all
  erb(:index)
end

post('/survey_topics') do
  name = params.fetch("survey_topic")
  @survey_topic = SurveyTopic.new({:topic => name, :id => nil})
  @survey_topic.save()
  @survey_topics = SurveyTopic.all
  erb(:index)
end

get('/survey_topics/:id') do
  @survey_topic = SurveyTopic.find(params.fetch("id").to_i())
  erb(:survey_topic)
end

post('/questions') do
  name = params.fetch("question")
  @survey_topic = SurveyTopic.find(params.fetch("survey_topic_id"))
  @question = Question.new({:question => name, :id => nil, :survey_topic_id => @survey_topic.id})
  @question.save()
  @survey_topics = SurveyTopic.all
  @questions = Question.all
  erb(:index)
end

patch('/update_survey_topics/:id') do
  @survey_topic = SurveyTopic.find(params.fetch("id").to_i())
  name = params.fetch("update_survey_topic")
  @survey_topic.update({:topic => name})
  erb(:survey_topic)
end

delete('/delete_survey_topics/:id') do
  @survey_topic = SurveyTopic.find(params.fetch("id").to_i())
  @survey_topic.delete
  @questions = Question.all()
  @questions.each do |question|
    if question.survey_topic_id == @survey_topic.id
      question.delete
    end
  end
  @survey_topics = SurveyTopic.all
  @questions = Question.all
  erb(:index)
end
