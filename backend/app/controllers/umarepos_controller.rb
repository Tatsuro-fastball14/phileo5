class UmareposController < ApplicationController
  
  def new 
  @umarepo =Umarepo.new
  @cook = Cook.find(params[:cook_id])
  end

  def create
  cook =Cook.find(params[:cook_id])

  @umarepo =cook.umarepos.build(umarepos_params)

  end

  def umarepos_params
    params.require(:umarepo).permit(:title,:curatop,:comment)
  end
end