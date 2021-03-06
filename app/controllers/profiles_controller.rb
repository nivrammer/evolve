class ProfilesController < ApplicationController
  # DEVISE ACTION USED TO LOCKDOWN PAGES
  before_action :authenticate_user!
  before_action :only_current_user

  def new
    @profile = Profile.new    
  end

  def create
    # User who is currently logged in 
    # this comes from the url
    # PATH NEEDS THIS CODE id: params[:user_id]
    @user = User.find( params[:user_id] )
    # Create profile link to user
    @profile = @user.build_profile( profile_params )

    if @profile.save 
      flash[:success] = "Profile Updated"
      redirect_to user_path(id: params[:user_id] )
    else
      render action: :new
    end
  end

  def edit
    @user = User.find( params[:user_id] )
    @profile = @user.profile
  end

  def update
    @user = User.find( params[:user_id] )
    @profile = @user.profile
    if  @profile.update_attributes( profile_params )
      flash[:success] = "Profile updated!"
      redirect_to user_path(id: params[:user_id])
    else
      render action: :edit
    end
  end

  private
  # WHITELISTING THE FORM SO HACKER CANT ADD FORM FIELD
  # USES FOR MASS ASSIGN
  def profile_params
    params.require(:profile).permit(:avatar, :first_name, :last_name, :job_title, :phone_number, :description) 
  end

  def only_current_user
    @user = User.find( params[:user_id] )
    redirect_to(root_path) unless @user == current_user
  end
end
