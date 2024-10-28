class FlatsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  # Affiche tous les logements
  def index
    @flats = Flat.all
  end

  # Affiche les détails d'un logement spécifique
  def show
    @flat = Flat.find(params[:id])
  end

  # Affiche le formulaire pour un nouveau logement
  def new
    @flat = Flat.new
  end

  # Crée un nouveau logement
  def create
    @flat = Flat.new(flat_params)
    if @flat.save
      redirect_to @flat, notice: "Flat was successfully created."
    else
      render :new
    end
  end

  # Affiche le formulaire d'édition pour un logement existant
  def edit
    @flat = Flat.find(params[:id])
  end

  # Met à jour un logement existant
  def update
    @flat = Flat.find(params[:id])
    if @flat.update(flat_params)
      redirect_to flat_path(@flat), notice: "Flat updated successfully."
    else
      render :edit
    end
  end

  # Supprime un logement
  def destroy
    @flat = Flat.find(params[:id])
    @flat.destroy
    redirect_to flats_path, notice: "Flat was successfully deleted."
  end

  private

  # Définit les paramètres autorisés pour un logement
  def flat_params
    params.require(:flat).permit(:name, :description, :price_per_night, :address, :image_url)
  end

end
