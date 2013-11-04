class FrogsController < ApplicationController

  before_action :source_frog, only: [:show, :edit, :update, :destroy]

  def index
    @frogs = Frog.all
  end

  def create
    @frog = Frog.create(frog_params)
    redirect_to frog_path(@frog)
  end

  def new
    @ponds = Pond.all
  end

  def show
  end

  def edit
    @ponds = Pond.all
  end

  def update
    @frog.update_attributes!(frog_params)
    redirect_to @frog
  end

  def destroy
    @frog.destroy
    redirect_to frogs_path
  end

  private

  def source_frog
    @frog = Frog.find(params[:id])
  end

  def frog_params
    params.require(:frog).permit(:name, :color, :pond_id)
  end
  
end
