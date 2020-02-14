class CocktailsController < ApplicationController
  before_action :find_cocktail, only: [ :show, :destroy]

  def index
    @cocktails = Cocktail.all
  end

  def show
    @dose = Dose.new
    @image = Image.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      if params[:commit] == 'Submit without details'
        redirect_to root_path
      elsif params[:commit] == 'Add details'
        redirect_to cocktail_path(@cocktail)
      end
    else
      render :new
    end
  end

  def destroy
    @cocktail.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Cocktail was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end
