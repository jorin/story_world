class CharactersController < ApplicationController
  respond_to :json

  def index
    render json: Character.all, each_serializer: CharacterSerializer
  end

  def show
    render json: Character.find(params[:id])
  end

  def create
    c = Character.new(character_params)
    if c.save
      render json: c
    else
      render json: { errors: c.errors.messages }, status: 422
    end
  end

  def update
    c = Character.find(params[:id])

    if c.update_attributes(character_params)
      render json: c, status: :ok
    else
      render json: { errors: c.errors.messages }, status: 422
    end
  end

  def destroy
    c = Character.find(params[:id])

    if c.destroy
      render json: nil, status: :ok
    else
      render json: { errors: c.errors.messages }, status: 404
    end
  end

  private

  def character_params
    params.require(:character).permit(:name, :description, :started_at, :ended_at)
  end
end
