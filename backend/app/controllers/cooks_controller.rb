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
        render json: @cook
    else
        render json: @cook.errors, status: 422
    end
  end

  def show
    @cook = Cook.find(params[:id])
    # render json: {
    #   cook_umarepo_output: @cook.as_json(include:  :umarepos)
    # }
    render json:  @cook,methods: [:images_urls], include: :umarepos
  end

  def search
    @p = Cook.ransack(params[:q])
    @cooks = @p.result.page(params[:page])
    render json: { cooks: @cooks.map { |cook| { id: cook.id, image: cook.images[0], store_catchcopy: cook.store_catchcopy } } }
  end
end



private

def cooks_params
  params.require(:cook).permit(:store, :store_catchcopy, :sentence, :address, :phone_number, :category, :lat, :lng,images: [])
end
