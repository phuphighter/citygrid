require 'helper'

class CitygridTest < Test::Unit::TestCase

  context "Citygrid API" do
    setup do
      @client = Citygrid::Client.new(:api_key => 'wtf')
    end
    
    context "and searching for a place" do
      should "find a specific place" do
        # stub_get("http://api.citygridmedia.com/content/places/v2?what=roots%20coffee&api_key=wtf&where=76180&publisher=acme", "search.xml")
        search_result = @client.search_locations(:what => "roots coffee", :where => "76180")
        search_result.results.locations.first[1].name.should == "Roots Coffeehouse"
        search_result.results.locations.first[1].address.postal_code.should == "76180"
      end
    end
    
    context "and find detail for a place" do
      should "hanger 94" do
        search_result = @client.detail(:phone => "6196609393", :client_ip=>"127.0.0.1")
        puts search_result.locations.first[1].name.should == "Hanger 94"
      end
    end

    
    # context "and get profile" do
    #   should "get specific profile data" do
    #     stub_get("http://api.citygridmedia.com/content/places/v2/profile/?api_key=wtf&client_ip=127.0.0.1&listing_id=613027480&publisher=acme", "profile.xml")
    #     profile = @client.profile(:client_ip => "127.0.0.1", :listing_id => 613027480)
    #     profile.locations.location.name.should == "Roots Coffeehouse"
    #     profile.locations.location.address.latitude.should == "32.849869"
    #   end
    # end  
    # 
    # context "and get reviews" do
    #   should "get specific reviews" do
    #     stub_get("http://api.citygridmedia.com/content/places/v2/reviews/?publisher=acme&api_key=wtf&tag_name=restaurant&where=90069", "review.xml")
    #     restaurant_reviews = @client.reviews(:where => '90069', :tag_name => 'restaurant')
    #     restaurant_reviews.reviews.first.last.first.business_name.should == "Cafe du Qvondeyz"
    #     restaurant_reviews.reviews.first.last[1].business_name.should == "Joselito's Mexican Food"
    #   end
    # end
  end

end