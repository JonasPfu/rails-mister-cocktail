class ImagesController < ApplicationController
  def create
    @image = Image.new(image_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @image.cocktail = @cocktail
    if @image.save
      redirect_to cocktail_path(@image.cocktail)
    else
      render 'cocktails/show' # render 'cocktails/show.html.erb'
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    redirect_to cocktail_path(@image.cocktail)
  end

  private

  def image_params
    params.require(:image).permit(:url, :title)
  end
end
