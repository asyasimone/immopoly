# app/services/ban_api_service.rb
require 'httparty'

class BanApiService
  include HTTParty
  base_uri 'https://api-adresse.data.gouv.fr'

  def autocomplete(query)
    response = self.class.get('/search', query: { q: query, limit: 5 })
    parse_response(response)
  end

  private

  def parse_response(response)
    if response.success?
      response.parsed_response['features'].map do |feature|
        {
          label: feature['properties']['label'],
          city: feature['properties']['city'],
          street: feature['properties']['street'],
          street_number: feature['properties']['housenumber'],
          zipcode: feature['properties']['postcode'],
          latitude: feature['geometry']['coordinates'][1],
          longitude: feature['geometry']['coordinates'][0]
        }
      end
    else
      []
    end
  end
end
