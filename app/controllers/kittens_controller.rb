class KittensController < ApplicationController
  before_action :set_kitten, only: [:show, :edit, :update, :destroy]

  def index
    @kittens = Kitten.all
    respond_to do |format|
      format.html
      format.json { render json: @kittens }
    end
  end

  def show
    @kitten = Kitten.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @kitten }
    end
  end

  def new
    @kitten = Kitten.new
  end

  def edit
  end

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      flash[:notice] = "Kitten was successfully created."
      redirect_to @kitten
    else
      flash[:alert] = "There was a problem creating the kitten."
      render :new
    end
  end

  def update
    if @kitten.update(kitten_params)
      flash[:notice] = "Kitten was successfully updated."
      redirect_to @kitten
    else
      flash[:alert] = "There was a problem updating the kitten."
      render :edit
    end
  end

  def destroy
    @kitten = Kitten.find(params[:id])
    @kitten.destroy
    redirect_to kittens_url, notice: "Kitten was successfully deleted."
  end
  

  private

  def set_kitten
    @kitten = Kitten.find(params[:id])
  end

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
