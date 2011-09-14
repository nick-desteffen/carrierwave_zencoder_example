class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :attachment
      t.string :zencoder_job_id
      t.boolean :processed

      t.timestamps
    end
  end
end
