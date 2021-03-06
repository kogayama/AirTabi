class RoomsController < ApplicationController
  before_action :set_room, except: [:index, :new, :create]
  before_action :is_authorised, only: [:listing, :pricing, :description, :photo_upload, :amenities, :location, :update]
  before_action :authenticate_user!, except: [:show]

  def index
    @rooms = current_user.rooms
  end

  def new
    @room = current_user.rooms.build
  end

  def create
    @room = current_user.rooms.build(room_params)
    if @room.save
      redirect_to listing_room_path(@room), notice: "保存しました"
    else
      flash[:alert] = "間違いがあります"
      render :new
    end
  end

  def show
  end

  def update
    if @room.update(room_params)
      flash[:notice] = "保存しました"
    else
      flash[:alert] = "間違いがあります"
    end
    redirect_back(fallback_location: request.referer)
  end

  def listing
  end

  def pricing
  end

  def description
  end

  def photo_upload
    @photos = @room.photos
  end

  def amenities
  end

  def location
  end

  private
    

    def set_room
      @room = Room.find(params[:id])
    end

    def is_authorised
      unless current_user.id == @room.user_id
        redirect_to root_path, alert: "あなたは許可されていません"
      end
    end

    def room_params
      params.require(:room).permit(:home_type, :room_type, :accommodate, :bed_room, :bath_room, :listing_name, :summary, :address, :is_tv, :is_kitchen, :is_air, :is_heating, :is_internet, :price, :active)
    end
end
