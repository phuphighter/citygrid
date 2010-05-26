# Citygrid

This is a Ruby wrapper for the [CityGrid API](http://developer.citysearch.com/home).

## Installation

As a gem:

    sudo gem install citygrid

As a plugin (in your Rails directory:

    script/plugin install git://github.com/phuphighter/citygrid.git
    
## Get a Citygrid API key

Sign up for a CityGrid API key: [http://developer.citysearch.com/member/register](http://developer.citysearch.com/member/register)
    
## Usage

### Instantiate a client

    >> citygrid = Citygrid::Client.new(:api_key => 'your_api_key')
    
### or configure once

    >> Citygrid.configure do |config|
    >>   config.api_key = 'your_api_key'
    >> end
    >> citygrid = Citygrid::Client.new
    
#### Examples

    >> citygrid.search_locations(:what => "roots coffee", :where => "76180", :rpp => 1)
    => {"results"=>{"region"=>{"name"=>"76180", "latitude"=>"32.86399", "type"=>"postal_code", "longitude"=>"-97.215194", "defaultradius"=>"4.3600"}, "firsthit"=>"1", "uri"=>"http://api.citysearch.com/search/locations?what=roots+coffee&where=76180&rpp=1&publisher=acme", "location"=>{"name"=>"Roots Coffeehouse", "address"=>{"city"=>"N Richland Hills", "postalcode"=>"76180", "street"=>"9101 Boulevard 26", "state"=>"TX"}, "rating"=>nil, "latitude"=>"32.849869", "userreviewcount"=>"0", "profile"=>"http://national.citysearch.com/profile/613027480/n_richland_hills_tx/roots_coffeehouse.html", "featured"=>"false", "phonenumber"=>"8175037344", "offers"=>nil, "id"=>"613027480", "hasvideo"=>"false", "hasoffers"=>"false", "neighborhood"=>nil, "longitude"=>"-97.193291", "samplecategories"=>"Coffeehouses"}, "queryid"=>"", "totalhits"=>"1", "histogram"=>{"name"=>"Categories", "item"=>"http://api.citysearch.com/search/locations?what=roots+coffee&tag=1726&where=76180&rpp=1&publisher=acme"}, "lasthit"=>"1"}}
    
    >>  citygrid.profile(:listing_id => '613027480', :client_ip => 'any_client_ip')
    => {"locations"=>{"location"=>{"display_ad"=>"true", "name"=>"Roots Coffeehouse", "address"=>{"city"=>"N Richland Hills", "latitude"=>"32.849869", "postal_code"=>"76180", "street"=>"9101 Boulevard 26", "delivery_point"=>nil, "cross_street"=>nil, "longitude"=>"-97.193291", "state"=>"TX"}, "urls"=>{"email_link"=>"http://national.citysearch.com/profile/email_business/613027480/n_richland_hills_tx/roots_coffeehouse.html", "reviews_url"=>"http://national.citysearch.com/review/613027480", "video_url"=>nil, "website_url"=>"http://national.citysearch.com/profile/external/613027480/n_richland_hills_tx/roots_coffeehouse.html", "map_url"=>"http://national.citysearch.com/profile/map/613027480/n_richland_hills_tx/roots_coffeehouse.html", "custom_link_1"=>nil, "profile_url"=>"http://national.citysearch.com/profile/613027480/n_richland_hills_tx/roots_coffeehouse.html", "custom_link_2"=>nil, "menu_url"=>nil, "reservation_url"=>nil, "send_to_friend_url"=>"http://national.citysearch.com/profile/sendto/613027480/n_richland_hills_tx/roots_coffeehouse.html"}, "markets"=>{"market"=>"Fort Worth, TX Metro"}, "offers"=>nil, "attributes"=>nil, "contact_info"=>{"display_phone"=>"8175037344", "display_url"=>"http://national.citysearch.com/profile/613027480/n_richland_hills_tx/roots_coffeehouse.html"}, "customer_content"=>{"customer_message_url"=>nil, "customer_message"=>nil, "bullets"=>nil}, "tips"=>nil, "id"=>"613027480", "reference_id"=>"1", "parking"=>nil, "images"=>nil, "infousa_id"=>"695618793", "teaser"=>nil, "neighborhoods"=>nil, "business_hours"=>nil, "reviews"=>{"total_user_reviews"=>nil, "total_user_reviews_shown"=>nil, "overall_review_rating"=>"NA"}, "categories"=>{"category"=>{"name"=>"Coffeehouses", "parent"=>"Restaurants", "parentid"=>"1722", "nameid"=>"1726"}}, "editorials"=>nil}}}
    
You can search for locations and events, get reviews, and get business profiles.

## Copyright

Contact me if you have any suggestions and feel free to fork it!

Copyright (c) 2009 Johnny Khai Nguyen, released under the MIT license
