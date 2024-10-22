def search
  @p = Cook.ransack(params[:q])
  @cooks = @p.result.page(params[:page])
  render json: { cooks: @cooks.map { |cook| { id: cook.id, image: cook.images[0], store_catchcopy: cook.store_catchcopy } } }
end
