class CreateSurveyTopics < ActiveRecord::Migration[5.1]
  def change
    create_table(:survey_topics) do |t|
      t.column(:topic, :string)
      t.timestamps()
    end
    add_column(:questions, :survey_topic_id, :integer)  
  end
end
