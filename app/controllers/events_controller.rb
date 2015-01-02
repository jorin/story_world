class EventsController < ApplicationController
  respond_to :json

  def index
    render json: Event.all, each_serializer: EventSerializer
  end

  def show
    render json: Event.includes(:characters).find(params[:id])
  end

  def create
    e = Event.new(event_params)
    puts "\n\n\n\n\n#{ event_params }\n\n\n\n\n"
    if e.save
      render json: e
    else
      render json: { errors: e.errors.messages }, status: 422
    end
  end

  def update
    e = Event.includes(:characters).find(params[:id])

    if e.update_attributes(event_params)
      render json: e, status: :ok
    else
      render json: { errors: e.errors.messages }, status: 422
    end
  end

  def destroy
    e = Event.find(params[:id])

    if e.destroy
      render json: nil, status: :ok
    else
      render json: { errors: e.errors.messages }, status: 404
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :started_at, :ended_at, :location_id, {:character_ids => []})
  end
end
