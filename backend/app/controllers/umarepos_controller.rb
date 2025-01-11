class UmareposController < ApplicationController
  
  def new 
    @umarepo =Umarepo.new
    binding.pry
    @cook = Cook.find(params[:cook_id])
    binding.pry
  end

  def create
    @cook =Cook.find(params[:cook_id])
    @umarepo =@cook.umarepos.build(umarepos_params)
    @umarepo.user_id =current_user.id
  end

  private
  def umarepos_params
    params.require(:umarepo).permit(:title,:curatop,:comment,:cook_id)
  end
end



