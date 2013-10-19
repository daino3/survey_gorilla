class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :title
      t.integer :photo_id
      t.integer :creator_id
      t.timestamps
    end
  end
end
