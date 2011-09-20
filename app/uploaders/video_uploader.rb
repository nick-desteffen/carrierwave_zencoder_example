class VideoUploader < CarrierWave::Uploader::Base
  include Rails.application.routes.url_helpers
 
  Rails.application.routes.default_url_options = ActionMailer::Base.default_url_options
 
  after :store, :zencode
 
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
 
  def extension_white_list
    %w(mov avi mp4 mkv wmv mpg)
  end
 
  def filename
    "video.mp4" if original_filename
  end
 
  private 
 
  def zencode(args)
    zencoder_response = Zencoder::Job.create({:input => "cf://rackspace_username:rackspace_api_key@blog.uploads/uploads/video/attachment/#{@model.id}/video.mp4",
                                              :output => [{:base_url => "cf://rackspace_username:rackspace_api_key@blog.uploads/uploads/video/attachment/#{@model.id}",
                                                           :filename => "video.mp4",
                                                           :label => "web",
                                                           :notifications => [zencoder_callback_url(:protocol => 'http')],
                                                           :video_codec => "h264",
                                                           :audio_codec => "aac",
                                                           :quality => 3,
                                                           :width => 854,
                                                           :height => 480,
                                                           :format => "mp4",
                                                           :aspect_mode => "preserve",
                                                           :public => 1}]
                                              })
 
    zencoder_response.body["outputs"].each do |output|
      if output["label"] == "web"
        @model.zencoder_output_id = output["id"]
        @model.processed = false
        @model.save(:validate => false)
      end
    end
  end
 
end