module Citygrid
  
  class Client
    include HTTParty
    base_uri "http://api2.citysearch.com"
    
    attr_reader :api_key
                
    def initialize(options={})
      @api_key = options[:api_key] || Citygrid.api_key
    end

    def search_locations(options={})
      response = self.class.get("/search/locations", :query => options.merge(self.default_options))
    end
    
    def search_events(options={})
      response = self.class.get("/search/events", :query => options.merge(self.default_options))
    end
    
    def profile(options={})
      if options[:client_ip].nil?
        puts "Dude, a client_ip is required."
      else
        response = self.class.get("/profile/", :query => options.merge(self.default_options))
      end
    end
    
    def reviews(options={})
      response = self.class.get("/reviews/", :query => options.merge(self.default_options))
    end
    
    protected
    
    def default_options
      {:api_key => @api_key, :publisher => "acme"}
    end
    
  end
end
