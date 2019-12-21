class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:edit, :update]

  def edit
  end

  def update
    if @user.update(user_params)
        redirect_to @user, notice: 'Tu perfil se ha actualizado.'
      else
        render :edit
      end
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :company_name, :phone)
    end

    def set_user
      @user = current_user
    end
end
