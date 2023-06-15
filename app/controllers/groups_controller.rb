class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  def index
    @groups = @user.groups
  end

  def show
    @group = @user.groups.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.new(group_params)
    if @group.save
      flash[:notice] = 'Group created successfully'
      redirect_to user_groups_path(current_user)
    else
      flash[:notice] = 'Group creation failed'
      redirect_to new_user_group_path(current_user)
    end
  end

  def destroy
    @group = @user.groups.find(params[:id])
    flash[:notice] = if @group.destroy
                       'Group deleted successfully'
                     else
                       'Group was not deleted'
                     end
    redirect_to user_groups_path(@user)
  end

  private

  def set_user
    @user = User.includes(:groups).find(params[:user_id])
  end

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
