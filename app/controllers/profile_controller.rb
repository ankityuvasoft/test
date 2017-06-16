class ProfileController < ApplicationController
  def index
    
    @profile = Profile.first
  end
end
