class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:ICT_ID, :commune_id, :user_NAMES, :user_LASTNAME1, :user_LASTNAME2, :user_DATE_OF_BIRTH, :user_PHONE, :user_CELLPHONE, :user_SEX, :user_ADDRESS, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:ICT_ID, :commune_id, :user_NAMES, :user_LASTNAME1, :user_LASTNAME2, :user_DATE_OF_BIRTH, :user_PHONE, :user_CELLPHONE, :user_SEX, :user_ADDRESS, :email, :password, :password_confirmation)
  end
end
