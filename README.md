# Why I Forked Citygrid

To support their version 2 api.  http://docs.citygridmedia.com/display/citygridv2/CityGrid+APIs

You can not run version 1 and 2 gems at the same time.  Why?  Well their documentation says their V1 API will be depreciated at some 
point in time.





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

    >> spot = citygrid.search_locations(:what => "roots coffee", :where => "76180", :rpp => 1)
    >> spot.results.location.name
    => "Roots Coffeehouse"
    
    >> profile = citygrid.profile(:listing_id => '613027480', :client_ip => 'any_client_ip')
    >> profile.locations.location.categories
    => <#Hashie::Mash category=<#Hashie::Mash name="Coffeehouses" nameid="1726" parent="Restaurants" parentid="1722">>
    
You can search for locations and events, get reviews, and get business profiles.

## Copyright

Contact me if you have any suggestions and feel free to fork it!

Copyright (c) 2009 Johnny Khai Nguyen, released under the MIT license
