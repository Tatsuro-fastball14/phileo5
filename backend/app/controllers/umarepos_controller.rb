class UmareposController < ApplicationController
  before_action :authenticate_user!, only: [:create,:new]
  before_action :set_cook
  
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
   
    
    @umarepo =@cook.umarepos.build(umarepos_params)
     
    # @umarepo.user_id =current_user.id
     if
      @umarepo.save!
      
      redirect_to root_path
    else
      render :new
    end
   
  end

  

  private
  def umarepos_params
    params.require(:umarepo).permit(:title,:curator,:comment,:cook_id)
  end


  def set_cook
    @cook = Cook.find(params[:cook_id])
  end
end



