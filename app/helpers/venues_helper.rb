module VenuesHelper
  def gmap_image_100(venue)
    image_tag("http://maps.googleapis.com/maps/api/staticmap?&size=100x100&zoom=13&markers=#{venue.lat},#{venue.long}&sensor=false",
              alt: venue.name, class: "avatar")
  end
  
  def gmap_image_path_200(venue)
    "http://maps.googleapis.com/maps/api/staticmap?&size=200x200&zoom=14&markers=#{venue.lat},#{venue.long}&sensor=false"
  end
end