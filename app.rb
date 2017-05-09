require('sinatra')
require('sinatra/reloader')
require('sinatra/activerecord')
also_reload('lib/**/*.rb')
require('./lib/questions')
require('./lib/survey_topics')
require('pg')
require('pry')

get('/') do
  erb(:index)
end
