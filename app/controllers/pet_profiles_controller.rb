class PetProfilesController < ApplicationController
  def index
    @pets = policy_scope(PetProfile)
  end

  def show
    @pet = PetProfile.find(params[:id])
    authorize @pet
  end

  def new
    @pet = PetProfile.new
    authorize @pet
  end

  def create
    @pet = PetProfile.new(pet_params)
    @pet.user = current_user
    authorize @pet
    if @pet.save
      redirect_to pet_profile_path(@pet)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def pet_params
    params.require(:pet_profile).permit(:name, :species, :breed, :age, :weight, :vaccinations, :neutered, :microchip, :description, :gender)
  end
end
