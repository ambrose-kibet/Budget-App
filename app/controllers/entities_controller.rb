class EntitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_group
  def index
    @entities=@user.entities
  end

  def show
    @entity=@user.entities.find(params[:id])
  end

  def new
    @entity=Entity.new
    @groups=Group.all.where(id:params[:group_id])
  end

  def create
    @entity=current_user.entities.new(entity_params)
    @group.entities <<  @entity
    if @entity.save
      flash[:notice]='Transaction created successfully'
      redirect_to user_group_path(current_user,@group)
    else
      flash[:notice]='Transaction creation failed'
       redirect_to  new_user_group_entity_path(current_user,@group)
    end  
  end

  def destroy
    @entity=@user.entities.find(params[:id])
    if @entity.destroy
      flash[:notice]='Transaction deleted successfully'
    else
      flash[:notice]='Transaction was not deleted'
    end 
    redirect_to user_groups_path(@user) 
  end

  private
  def set_user
    @user=User.includes(:groups).find(params[:user_id])
  end

  def set_group
    @group=@user.groups.find(params[:group_id])
  end

  def entity_params
    params.require(:entity).permit(:name,:amount)
  end
end
