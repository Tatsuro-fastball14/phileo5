class UmareposController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  
 def index
    @umarepos = @cook.umarepos
    render json: @umarepos
  end
  
  def new 
    @umarepo =Umarepo.new
    @cook = Cook.find(params[:cook_id])  
  end

  def create
    @cook =Cook.find(params[:cook_id])
     binding.pry
    @umarepo =@cook.umarepos.build(umarepos_params)
     binding.pry
    @umarepo.user_id =current_user.id
    binding.pry
  end

  

  private
  def umarepos_params
    params.require(:umarepo).permit(:title,:curator,:comment,:cook_id)
  end
end



