class FlatsController < ApplicationController
  # Affiche tous les logements
  def index
    @flats = Flat.all
  end

  # Affiche les détails d'un logement spécifique
  def show
    @flat = Flat.find(params[:id])
  end
end

def new
  @flat = Flat.new
end

def create
  @flat = Flat.new(flat_params)
  if @flat.save
    redirect_to @flat, notice: "Flat was successfully created."
  else
    render :new
  end
end

private

def flat_params
  params.require(:flat).permit(:name, :description, :price, :location)
end
