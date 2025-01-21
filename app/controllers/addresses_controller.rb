# app/controllers/addresses_controller.rb
class AddressesController < ApplicationController
  def autocomplete
    query = params[:query]
    results = BanApiService.new.autocomplete(query)
    render json: results
  end
end
