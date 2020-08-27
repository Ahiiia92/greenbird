class UsersController < ApplicationController
  before_action :set_user

  def dashboard
    @challenges = @user.challenges
    @timeline = [["Washington", "1789-04-29", "1797-03-03"],
  ["Adams", "1797-03-03", "1801-03-03"],
  ["Jefferson", "1801-03-03", "1809-03-03"]]
  end

  def show
    @challenges = @user.challenges
    @timeline =   [["Washington", "1789-04-29", "1797-03-03"],
  ["Adams", "1797-03-03", "1801-03-03"],
  ["Jefferson", "1801-03-03", "1809-03-03"]]
  end

  def edit
  end

  def update
    if @user == current_user
      @user.update(user_params)
      redirect_to user_path(@user)
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :bio, :username, :country, :photo)
  end

  def set_user
    @user = User.find(params[:id])
    authorize @user
  end


end
