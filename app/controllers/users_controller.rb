class UsersController < ApplicationController
  before_action :ensure_signed_in, except: %i[index map]

  def show
    @user = User.find(params[:id])
    @proposals = @user.proposals
  end

  def index
    @users = User.all
  end

  def edit
    @user = current_user
  end

  def update
    if current_user.update(user_params)
      redirect_back_or(current_user, flash: { success: "Profile updated." })
    else
      render :edit
    end
  end

  def destroy
    current_user.destroy!
    reset_session
    redirect_to root_path
  end

  def map
    @marker_data = User.mappable.map do |user|
      link = ActionController::Base.helpers.link_to(user.name, user_path(user))
      { latlng: user.latlng, popup: link.html_safe, icon: "user" }
    end
  end

  private

  def user_params
    attrs = %i[email location name about]
    params.require(:user).permit(attrs)
  end
end
