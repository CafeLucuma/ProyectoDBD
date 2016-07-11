class TakeHoursController < ApplicationController
  def index

	#buscar el doctor con los nombres ingresados
	@doctor = User.find_by_sql("select * from users inner join doctors on doctors.user_id = users.user_id where user_NAMES = '#{params[:nombre]}'")

	if @doctor.count == 0
		redirect_to search_medics_index_path
	end

	#bloques de atención del doctor
	@abs = AttentionBlock.find_by_sql("select * from attention_blocks ab inner join doctors d on d.doctor_id = ab.doctor_id inner join users u on u.user_id = d.user_id where u.user_NAMES = '#{params[:nombre]}'")

	#especialidades de los bloques
	@specs = Specialty.find_by_sql("select * from specialties")
  end

  def show
	#buscar especialidad
	@spec = Specialty.find_by_sql("select * from specialties where SPEC_NAME = '#{params[:specialty][:SPEC_NAME]}'")
	
	#buscar doctores con esa especialidad
	@doctors = User.find_by_sql("select * from users inner join doctors d on d.user_id = users.user_id inner join doctor_specialties ds on ds.doctor_id = d.doctor_id where ds.SPEC_ID = '#{@spec[0].SPEC_ID}'")	

  end

  def show2
  end

  def show3
  end
end
