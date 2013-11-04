class TadpolesController < ApplicationController

  before_action :source_tadpole, only: [:show, :edit, :update, :destroy, :evolve]

  def new
    @frog = Frog.find(params[:frog_id])
  end

  def index
    @tadpoles = Tadpole.all
  end

  def create
    @frog = Frog.find(params[:frog_id])
    @tadpole = @frog.tadpoles.build(tadpole_params)
    if @frog.save
      redirect_to frog_tadpole_path(@frog.id, @tadpole.id)
    end
  end

  def show
  end

  def edit
  end

  def update
    @tadpole.update_attributes!(tadpole_params)
    redirect_to @tadpole
  end

  def destroy
    @tadpole.destroy
    redirect_to tadpoles_path
  end

  def evolve
    @frog = Frog.new(:name => @tadpole.name, :color => @tadpole.color, :pond_id => @tadpole.frog.pond_id)
    if @frog.save
      @tadpole.destroy
      redirect_to @frog
    end
  end

  private

  def source_tadpole
    @tadpole = Tadpole.find(params[:id])
  end

  def tadpole_params
    params.require(:tadpole).permit(:name, :color, :frog_id)
  end
  
end
