class CreateTakensurveys < ActiveRecord::Migration
  def change
    create_table :takensurveys do |t|
      t.integer :user_id
      t.integer :survey_id
      t.timestamps
    end
  end
end

