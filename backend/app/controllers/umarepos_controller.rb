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
    # ネストされた @cook に確実に紐づける。cook_id は params から受け取らない
    @umarepo = @cook.umarepos.new(umarepo_params)
    # ユーザー紐づけを使うなら
    @umarepo.user = current_user if defined?(current_user) && current_user

    if @umarepo.save
      respond_to do |format|
        format.html { redirect_to cook_path(@cook), notice: '口コミを投稿しました' }
        format.json { render json: @umarepo, status: :created }
      end
    else
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: { errors: @umarepo.errors.full_messages }, status: :unprocessable_entity }
      end
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



