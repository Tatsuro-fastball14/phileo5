class CooksController < ApplicationController
  before_action :authenticate_user!, except: [:index,:search]
  before_action :search_cook, only: [:index, :search]
  before_action :basic_auth, only: [:new]
  before_action :set_cook, only: [:edit, :show,:update,:destroy]

  def index
    @cooks =  Cook.all
    render json: @cooks
  end
  

  def create
    @cook = Cook.new(cooks_params)
    if  @cook.save
        redirect_to root_path
    else
        render :new
    end
  end


  

  def cooks_params
    params.require(:cook).permit(:store_catchcopy, :sentence, :address, :phone_number,:store,:category,:lat,:lng,:order,images:[],videos:[])
  end

end

 