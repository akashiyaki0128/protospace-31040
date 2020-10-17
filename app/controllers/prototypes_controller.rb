class PrototypesController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :ensure_current_user, only: :edit

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype= Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else 
      render :new
    end
    
  end

  def edit
    @prototype = Prototype.find(params[:id])
  end

  def update
    prototype = Prototype.find(params[:id]) 
    if prototype.update(prototype_params)
      redirect_to prototype_path(prototype.id)
    else 
      render :edit
    end
    
  end

  def destroy
    prototype = Prototype.find(params[:id]) 
    if prototype.destroy
      redirect_to root_path
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comments = @prototype.comments.includes(:user)
    @comment = Comment.new
  end

  private
  def prototype_params
    params.require(:prototype).permit(:title,:catch_copy,:concept,:image).merge(user_id: current_user.id)
  end

  def ensure_current_user
    @prototype = Prototype.find(params[:id])
    @user = current_user
    if @user.id != @prototype.user_id
      redirect_to root_path
    end
  end



end
