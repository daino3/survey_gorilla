class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :file, :title
      t.integer :survey_id
      t.timestamps
    end
  end
end
