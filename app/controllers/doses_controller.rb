class DosesController < ApplicationController

  # GET /doses/new
  def new
    @ingredients = Ingredient.all
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  # POST /doses
  # POST /doses.json
  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = @cocktail.doses.new(dose_params)
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'new'
    end
  end

  # DELETE /doses/1
  # DELETE /doses/1.json
  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    respond_to do |format|
      format.html { redirect_to doses_url, notice: 'Dose was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def dose_params
      # dose is connected with a foreigh key from 'ingredient'
      params.require(:dose).permit(:description, :ingredient_id)
    end
end
