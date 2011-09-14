class Video < ActiveRecord::Base 
 
  attr_accessible :attachment
 
  validates_presence_of :attachment
  
  mount_uploader :attachment, VideoUploader
 
  def processed!
    update_attribute(:processed, true)
  end
 
end