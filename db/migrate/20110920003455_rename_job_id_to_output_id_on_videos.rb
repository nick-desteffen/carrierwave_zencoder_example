class RenameJobIdToOutputIdOnVideos < ActiveRecord::Migration
  def up
    rename_column :videos, :zencoder_job_id, :zencoder_output_id
  end

  def down
    rename_column :videos, :zencoder_output_id, :zencoder_job_id
  end
end
