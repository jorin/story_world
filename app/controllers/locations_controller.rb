class LocationsController < ApplicationController
  respond_to :json

  def index
    render json: Location.all, each_serializer: LocationSerializer
  end

  def show
    render json: Location.find(params[:id])
  end

  def create
    l = Location.new(location_params)
    if l.save
      render json: l
    else
      render json: { errors: l.errors.messages }, status: 422
    end
  end

  def update
    l = Location.find(params[:id])

    if l.update_attributes(location_params)
      render json: l, status: :ok
    else
      render json: { errors: l.errors.messages }, status: 422
    end
  end

  def destroy
    l = Location.find(params[:id])

    if l.destroy
      render json: nil, status: :ok
    else
      render json: { errors: l.errors.messages }, status: 404
    end
  end

  private

  def location_params
    params.require(:location).permit(:name, :description, :started_at, :ended_at)
  end
end
