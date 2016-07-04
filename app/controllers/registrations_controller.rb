class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:ICT_ID, :communes_ID, :users_NAMES, :users_LASTNAME1, :users_LASTNAME2, :users_DATE_OF_BIRTH, :users_PHONE, :users_CELLPHONE, :users_SEX, :users_ADDRESS, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:ICT_ID, :communes_ID, :users_NAMES, :users_LASTNAME1, :users_LASTNAME2, :users_DATE_OF_BIRTH, :users_PHONE, :users_CELLPHONE, :users_SEX, :users_ADDRESS, :email, :password, :password_confirmation)
  end



end
