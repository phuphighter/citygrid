require 'helper'

class CitygridTest < Test::Unit::TestCase

  context "Citygrid API" do
    setup do
      @client = Citygrid::Client.new(:api_key => 'wtf')
    end
    
    context "and searching for a place" do
      should "find a specific place" do
        stub_get("http://api2.citysearch.com/search/locations?what=roots%20coffee&api_key=wtf&where=76180&publisher=acme", "search.xml")
        search_result = @client.search_locations(:what => "roots coffee", :where => "76180")
        search_result.results.location.name.should == "Roots Coffeehouse"
        search_result.results.location.address.postalcode.should == "76180"
      end
    end
    
    context "and get profile" do
      should "get specific profile data" do
        stub_get("http://api2.citysearch.com/profile/?api_key=wtf&client_ip=127.0.0.1&listing_id=613027480&publisher=acme", "profile.xml")
        profile = @client.profile(:client_ip => "127.0.0.1", :listing_id => 613027480)
        profile.locations.location.name.should == "Roots Coffeehouse"
        profile.locations.location.address.latitude.should == "32.849869"
      end
    end  
    
    context "and get reviews" do
      should "get specific reviews" do
        stub_get("http://api2.citysearch.com/reviews/?publisher=acme&api_key=wtf&tag_name=restaurant&where=90069", "review.xml")
        restaurant_reviews = @client.reviews(:where => '90069', :tag_name => 'restaurant')
        restaurant_reviews.reviews.first.last.first.business_name.should == "Cafe du Qvondeyz"
        restaurant_reviews.reviews.first.last[1].business_name.should == "Joselito's Mexican Food"
      end
    end
  end

end