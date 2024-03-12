class UsersController < ApplicationController
  def dashboard
    @user = current_user
    authorize @user
    # @profile = current_user.profile
  end

end
