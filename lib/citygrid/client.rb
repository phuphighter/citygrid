module Citygrid
  
  class Client
    include HTTParty
    base_uri "http://api.citygridmedia.com/content/places/v2"
    format :xml
    
    attr_reader :api_key
                
    def initialize(options={})
      @api_key = options[:api_key] || Citygrid.api_key
    end

    def search_locations(options={})
      mashup(self.class.get("/search/where", :query => options.merge(self.default_options)))
    end

    def detail(options={})
      mashup(self.class.get("/detail", :query => options.merge(self.default_options)))
    end
    
    # def search_events(options={})
    #   mashup(self.class.get("/search/events", :query => options.merge(self.default_options)))
    # end
    
    # def profile(options={})
    #   if options[:client_ip].nil?
    #     puts "Dude, a client_ip is required."
    #   else
    #     mashup(self.class.get("/profile/", :query => options.merge(self.default_options)))
    #   end
    # end
    
    # def reviews(options={})
    #   mashup(self.class.get("/reviews/", :query => options.merge(self.default_options)))
    # end
    
    protected
    
    def default_options
      {:api_key => @api_key, :publisher => "acme"}
    end
    
    def mashup(response)
      puts response.inspect
      case response.code
      when 200
        if response.is_a?(Hash)
          Hashie::Mash.new(response)
        else
         if response.first.is_a?(Hash)
           response.map{|item| Hashie::Mash.new(item)}
         else
           response
         end
        end
      end
    end
  end
    
end
