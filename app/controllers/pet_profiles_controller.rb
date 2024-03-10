class PetProfilesController < ApplicationController
  def show
    @pet = PetProfile.find(params[:id])
  end

  def new
    @pet = PetProfile.new
  end
                  
  def create
    @pet = PetProfile.new(pet_params)
    @pet.user = current_user
    if @pet.save
      redirect_to pet_profile_path(@pet)
    else
      render :new, status: :unprocessable_entity
    end


  end


end
