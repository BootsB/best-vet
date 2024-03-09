class PetProfilesController < ApplicationController
  def show
    @pet = PetProfile.find(params[:id])
  end
end
