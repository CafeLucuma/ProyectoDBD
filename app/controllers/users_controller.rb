class UsersController < ApplicationController
  def index
	@users = User.order(:users_ID)
  end

  def new
  end

	def create
		#instanciar nuevo objeto
		ict = params[:user][:ICT_ID].to_i
		comuna = params[:user][:communes_ID].to_i
		names = params[:user][:users_NAMES]
		paterno = params[:user][:users_LASTNAME1]		
		materno = params[:user][:users_LASTNAME2]		
		email = params[:user][:users_EMAIL]
		User.crear(ict, comuna, names, paterno, materno, email)

		redirect_to(:action => 'index')

	end

  def edit
	if current_user.users_ID != params[:id].to_i
		redirect_to users_index_path, notice: 'No puedes editar otro usuario'
	else
		@user = User.find_by_users_ID(params[:id])
	end
  end

  def delete
  end

  def show
	@user = User.find_by_users_ID(params[:id])
  end

  def update
		#instanciar nuevo objeto
		@user = User.find_by_users_ID(params[:id])
		@user.update_attributes(user_params)		

		#guardarlo con datos de form
		if @user.update_attributes(user_params)
			redirect_to(:action => 'show', :id => @user.users_ID )
		else	#si no
			render('edit')
		end
   end

   private
	#asigna todos los parámetros permitdos por permit de una 		mediante params
   def user_params
			params.require(:user).permit(:ICT_ID, :communes_ID, :users_NAMES, :users_LASTNAME1, :users_LASTNAME2, :users_EMAIL)
		end

end
