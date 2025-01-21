class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :update, :destroy]

  def index
    @projects = current_user.projects
  end

  def show
    @properties = @project.properties
    @city = @properties.first&.city
    @regulations = @city&.regulations if @city.present?
    @markers = @properties.geocoded.map do |property|
      {
        lat: property.latitude,
        lng: property.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {property: property}),

      }
    end
  end

  def new
    @project = Project.new
  end

  def create
    properties = params[:property_ids].map do |property_id|
      Property.find(property_id)
    end
    @project = Project.create(user: current_user, properties: properties, project_name: params[:project][:project_name])
    update_metrics(@project)
      redirect_to project_path(@project), notice: 'Projet sauvegardé avec succès'
  end

  def update
    if @project.update(project_params)
      update_metrics(@project)
      redirect_to project_path(@project), notice: 'Projet mis à jour avec succès'
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_url, notice: 'Projet supprimé avec succès'
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:project_name, :floor_area_ratio, :area_sqm_livable, :area_sqm_land, property_ids: [])
  end

  def update_metrics(project)
    project.area_sqm_land = project.properties.sum(:area_sqm_land)
    project.area_sqm_livable = project.properties.sum(:area_sqm_livable)

    total_weighted_ratio = project.properties.inject(0) do |sum, property|
      sum + (property.floor_area_ratio * property.area_sqm_land)
    end
    project.floor_area_ratio = total_weighted_ratio / project.area_sqm_land
    project.save
  end
end
