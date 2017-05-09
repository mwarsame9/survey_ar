# <!--PROJECT NAME HERE-->

<!--PROJECT DESCRIPTION HERE-->

### Prerequisites

Web browser with ES6 compatibility
Examples: Chrome, Safari

Ruby 2.3.1
Bundler

### Installing
To use this application, you must set up a database by running these commands:
First: install postgres
$ gem install pg
Then run  '$ postgres' in a new shell

Next, run these commands in your terminal to set up the database with Active Record for this app:
$ rake db:create
<!--create the table 'questions' with the columns 'question' and 'survey_topic_id'-->
$ rake db:create_migration NAME=create_questions
<!--check db folder to see migration success -->
$ rake db:migrate
<!--create the table 'survey_topics' with the column 'topic'-->
$ rake db:create_migration NAME=create_survey_topics
<!--check db folder to see migration success -->
$ rake db:migrate
<!--copy / mirror development database to a test database -->
$ rake db:test:prepare

Installation is quick and easy! First you can open this link <!--HEROKU LINK HERE--> to see the webpage in action live online. Or you can clone this repository to your machine, navigate to the file path in your terminal, and run 'app.rb' by typing '$ruby app.rb'. If you chose to clone the repository, after you run 'app.rb' you will need to copy the localhost path into your web browswer. The standard localhost for Sinatra is port 4567

## Built With

* Ruby
* Sinatra
* HTML
* CSS
* Bootstrap https://getbootstrap.com/
* ES6
* Jquery https://jquery.com/

## Specifications

| behavior |  input   |  output  |
|----------|:--------:|:--------:|
<!--SPECS GO HERE-->

## Authors

* <!--YOUR NAME HERE-->

## License

Copyright © 2017 <!--YOUR NAME HERE-->
