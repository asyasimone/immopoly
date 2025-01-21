class PropertiesController < ApplicationController

  def index
    @properties = current_user.properties
    @property = Property.find(params[:property]) if params[:property].present?
    @project = Project.new
    @cities = City.order(:city_name).pluck(:city_name, :id)

    @markers = @properties.geocoded.map do |property|
      {
        lat: property.latitude,
        lng: property.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {property: property}),

      }
    end

    selected_property_ids = params[:property_ids]
    if selected_property_ids.present?
      @selected_properties = Property.where(id: selected_property_ids)
    else
      @selected_properties = []
    end

  end

  def autocomplete
    query = params[:address]
    results = BanApiService.new.autocomplete(address)
    render json: results
  end

  def show
    @property = Property.find(params[:id])
    @markers =
      [{
        lat: @property.latitude,
        lng: @property.longitude
      }]
  end

  def create
    @property = Property.new(property_params)
    @property.user = current_user

    if @property.save!
      redirect_to properties_path(property: @property)
    else
      render :new
    end
  end

  def search
    @property = Property.find_by(address: params[:address].downcase)
    if @property
      redirect_to properties_path(property: @property)
    else
      flash[:alert] = "Property not found"
      redirect_to properties_path
    end
  end

  def edit
    @property = Property.find(params[:id])
  end

  def update
    @property = Property.find(params[:id])
    @property.update(property_params)
    redirect_to property_path(property: @property)
  end

  def destroy
    @property = Property.find(params[:id])
    @property.destroy
    redirect_to properties_path, notice: 'Projet supprimé avec succès'
  end

  private

  def property_params # strong params
    params.require(:property).permit(:city_id, :address, :street_number, :street_name, :zipcode, :building_height_floors, :nb_rooms_per_dwelling, :energy_class, :area_sqm_land, :year_construction, :area_sqm_livable, :floor_area_ratio, :nb_dwelling, :density_area, :building_zone)
  end
end
