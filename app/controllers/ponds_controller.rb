class PondsController < ApplicationController

  before_action :source_pond, only: [:show, :edit, :update, :destroy]

  def index
    @ponds = Pond.all
  end

  def create
    @pond = Pond.create(pond_params)
    redirect_to pond_path(@pond)
  end

  def new
  end

  def show
  end

  def edit
  end

  def update
    @pond.update(pond_params)
    # Write the code to find the correct pond
    # and set its attributes and save.
    # Then redirect to the index view listing all ponds.
    redirect_to ponds_path
  end

  def destroy
    @pond.destroy
    # Write the code to find the correct pond
    # and destroy it.
    # Then redirect to the index view listing all ponds.
    redirect_to ponds_path
  end

  private

  def source_pond
    @pond = Pond.find(params[:id])
  end

  def pond_params
    params.require(:pond).permit(:name, :water_type)
  end

end
