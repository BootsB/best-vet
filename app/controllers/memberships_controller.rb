class MembershipsController < ApplicationController
  include CloudinaryHelper

  def subscribe
    @membership = Membership.find(params[:membership_id])
    @collection = User.joins(user_profile: :membership).where(memberships: { name: "Basic" })
    @user = User.new
    @users = User.joins(user_profile: :membership).where(memberships: { name: "Basic" }).map do |user|
      {
        id: user.id,
        email: user.email,
        first_name: user.user_profile.first_name,
        last_name: user.user_profile.last_name,
        city: user.user_profile.city,
        pets: user.pet_profiles
      }
    end
    respond_to do |format|
      format.html
      format.json { render json: @users.as_json }
    end
    authorize @membership
  end
end
