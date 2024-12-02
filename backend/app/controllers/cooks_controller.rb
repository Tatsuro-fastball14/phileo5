class CooksController < ApplicationController

  def index
    @cooks = Cook.all
    render json: @cooks
  end

  def new
    @cook = Cook.new
    @umarepo = Umarepo.new
  end

  def create
    @cook = Cook.new(cooks_params)
    if  @cook.save
        redirect_to root_path
    else
        render :new
    end
  end

  def show
    @cook = Cook.find(params[:id])
    render json: @cook
  end

  def search
    @p = Cook.ransack(params[:q])
    @cooks = @p.result.page(params[:page])
    render json: { cooks: @cooks.map { |cook| { id: cook.id, image: cook.images[0], store_catchcopy: cook.store_catchcopy } } }
  end
end



private

def cooks_params
  params.require(:cook).permit(:store, :store_catchcopy, :sentence, :address, :phone_number, :category, :lat, :lng)
end
