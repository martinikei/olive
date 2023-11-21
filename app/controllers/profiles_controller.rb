class ProfilesController < ApplicationController
    before_action :authenticate_user!
  
    def edit
      @profile = current_user.profile
    end
  
    def update
      @profile = current_user.profile
      if @profile.update(profile_params)
        redirect_to "/", notice: 'Profile updated successfully.'
      else
        redirect_to "/", notice: 'Profile not updated'
      end
    end
  
    private
  
    def profile_params
      params.require(:profile).permit(:bio, :interests, :denomination, :attended_church, :gender, :location, :dob,:name,:surname,:work,:hobbies,:testimony,images: [])
    end
  end
  