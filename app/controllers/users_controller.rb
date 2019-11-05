class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @events_user = Event.where(admin: @user)

  end

  def new
    @user = User.new
  end

  def edit
  end

  def update
      if @user.update(user_params)
        redirect_to @user, notice: 'User was successfully updated.'
      else
        render :edit
      end
  end

  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
    def user_params
      return params.require(:user).permit(:first_name, :last_name, :description, :email)
    end

end
