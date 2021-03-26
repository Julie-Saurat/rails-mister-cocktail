class CocktailsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  
  def index
    @cocktails = policy_scope(Cocktail.all)
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    authorize @cocktail
    @dose = Dose.new
    authorize @dose
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.save
    redirect_to cocktail_path(@cocktail)
  end

  def edit
    @cocktail = Cocktail.find(params[:id])
  end

  def update
    @cocktail = Cocktail.find(params[:id])
    @cocktail.update(cocktail_params)
    @cocktail.save
    redirect_to cocktail_path(@cocktail)
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
    # params.require(:cocktail).permit(:name, :image_url)
  end
end
