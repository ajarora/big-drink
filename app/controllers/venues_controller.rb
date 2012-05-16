class VenuesController < ApplicationController
  
  def show
    @venue = Venue.find(params[:id])
    @drinks = @venue.drinks.paginate(page: params[:page])
    @action = "show_venue"
  end
  
  def index
    @venues = Venue.paginate(page: params[:page])
    @json = Venue.all.to_gmaps4rails
  end
    
  def new
    @venue = Venue.new(@venue)
  end
  
  def create
    client = Foursquare2::Client.new(:client_id => 'R1EFO2T1RQ4QVWTDC40Z3TJ3GB02XML51OX5GYSMK3UKSAXY',
                                     :client_secret => 'TP5TDBNNOXWQJJLBBCBFXGY0QLWPGOHSAE40XPLMRWKUQMBK')
    venueID = params[:venue][:foursquareID]
    @venue = Venue.new(name: client.venue(venueID).name,
                       foursquareID: venueID,
                       lat: client.venue(venueID).location.lat,
                       long: client.venue(venueID).location.lng)
    if @venue.save
      flash[:success] = "#{@venue.name} Successfully Added!"
      redirect_to @venue
    else
      render 'new'
    end
  end
end
