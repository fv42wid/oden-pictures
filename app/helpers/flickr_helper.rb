module FlickrHelper

  def user_photos(user_id, photo_count = 12)
    flickr.photos.search(:user_id => user_id).to_a[0..(photo_count -1)]
  end

  def render_flickr_sidebar(user_id, photocount = 12, columns = 2)
    begin
      photos = user_photos('12864272@N02', photocount).in_groups_of(2)
      render :partial => '/flickr/sidebar_widget', :locals => {:photos => photos}
    rescue Exception => e
      throw e
      render :partial => '/flickr/unavailable'
    end
  end

end
