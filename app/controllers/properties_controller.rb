class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :update, :destroy]

  def index
    properties = paginate Property.all, per_page: 10   
    render json: properties, status: :ok
  end

  def create
    properties = Property.create!(property_params)
    render json: properties, status: :created
  end

  def show
  	render json: @property, status: :ok
  end

  def update
  	@property.update(property_params)
    head :no_content
  end

  def destroy
    @property.destroy
    head :no_content
  end

  def search
    properties = paginate Property.filter(params.slice(:property_type,:sq_ft,:price))
    render json: properties
  end

  private

  def set_property
    @property = Property.find(params[:id])
  end

  def property_params
    params.permit(:street, :city, :zip, :state, :beds, :baths, :sq_ft, :property_type, :sale_date, :price, :latitude, :longitude)
  end	
end
