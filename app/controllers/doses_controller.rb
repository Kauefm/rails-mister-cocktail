class DosesController < ApplicationController

  def index
  end

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    @dose.save
    redirect_to cocktail_path(@cocktail)
  end

  def show
  end

  def edit
    @dose = Dose.find(params[:id])
  end

  def update
    @dose = Dose.find(params[:id])
     if @dose.update(dose_params)
      redirect_to cocktail_path(@dose.cocktail)
    else
      render 'edit'
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    @cocktail = @dose.cocktail
    redirect_to cocktail_path(@cocktail)
  end

  private

    def dose_params
      params.require(:dose).permit(:description, :amount, :ingredient_id)
    end
end
