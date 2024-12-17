class Public::PlacesController < ApplicationController
  def index
    @places = Place.all
    @places = Place.page(params[:page]).per(10)
  end
  
  def show
    @place = Place.find(params[:id])
    @events = @place.events
  end
  
  def new
    @place = Place.new
    @events = Event.all
  end
  
  def create
    @place = Place.new(place_params)
    if @place.save
      redirect_to @place, notice: '場所が作成されました！'
    else
      render :new
    end
  end


  def edit
    @place = Place.find(params[:id])
  end

  def update
    @place = Place.find(params[:id])
    if @place.update(place_params)
      flash.now[:alert] = '場所が更新されました'
      redirect_to place_path
    else
      render :edit
    end
  end
  
 private

  def place_params
    params.require(:place).permit(:name, :address, :description, :latitude, :longitude, event_ids: [])
  end
end
