class Video < ActiveRecord::Base 
 
  attr_accessible :attachment
 
  validates_presence_of :attachment
 
  def processed!
    update_attribute(:processed, true)
  end
 
end