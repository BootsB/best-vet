class UserProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_profile, only: [:show, :edit, :update]

  def show
    authorize @user_profile
  end

  def new
    @user_profile = current_user.build_user_profile
    authorize @user_profile
  end

  def edit
    # No need to find by :id, because it's the current user's profile
    authorize @user_profile
  end

  def create
    @user_profile = current_user.build_user_profile(user_profile_params)
    authorize @user_profile
    if @user_profile.save
      redirect_to @user_profile, notice: 'User profile was successfully created.'
    else
      render :new
    end
  end

  def update
    authorize @user_profile
    if @user_profile.update(user_profile_params)
      redirect_to @user_profile, notice: 'User profile was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_user_profile
    @user_profile = current_user.user_profile
  end

  def user_profile_params
    params.require(:user_profile).permit(:first_name, :last_name, :address, :description, :membership, :location,
                                         :city, :phone_number, :state, :zip_code, :licence_number)
  end
end
