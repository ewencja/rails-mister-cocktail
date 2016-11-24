class DosesController < ApplicationController
  before_action :find_cocktail, only: [ :new, :create]
  before_action :find_dose, only: [ :destroy]

  def new
    @dose = Dose.new
  end

  def create
    @dose = @cocktail.doses.build(dose_params)
    if @dose.save
      redirect_to cocktail_doses
    else
      render :new
    end
  end

  def destroy
    @dose.destroy
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def find_dose
    @dose = Dose.find(params[:dose_id])
  end
end
