class CocktailsController < ApplicationController
  before_action :find_cocktail, only: [ :show, :destroy]

  def index
    @cocktails = Cocktail.all
    url_cocktail_finder
  end

  def show
    @dose = Dose.new
    url_cocktail_finder
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      if params[:commit] == 'Submit without ingredients'
        redirect_to cocktails_path
      elsif params[:commit] == 'Add ingredients'
        redirect_to cocktail_path(@cocktail)
      end
    else
      render :new
    end
  end

  def destroy
    @cocktail.destroy
    respond_to do |format|
      format.html { redirect_to cocktails_url, notice: 'Cocktail was successfully deleted.' }
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

  def url_cocktail_finder
    url_cocktail_1 = "https://images.unsplash.com/photo-1470337458703-46ad1756a187?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1949&q=80"
    url_cocktail_2 = "https://images.unsplash.com/photo-1536935338788-846bb9981813?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1886&q=80"
    url_cocktail_3 = "https://images.unsplash.com/photo-1546171753-97d7676e4602?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80"
    url_cocktail_4 = "https://images.unsplash.com/photo-1559443922-3f698a0ff27a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=969&q=80"
    url_cocktail_5 = "https://images.unsplash.com/photo-1556855810-ac404aa91e85?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80"
    url_cocktail_6 = "https://images.unsplash.com/photo-1514362545857-3bc16c4c7d1b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80"

    @url_cocktail = [url_cocktail_1, url_cocktail_2, url_cocktail_3, url_cocktail_4, url_cocktail_5, url_cocktail_6]
  end
end
