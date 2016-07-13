class MyHoursController < ApplicationController
before_action :authenticate_user!

  def mishoras
	@horas = ReservedHour.find_by_sql("select * from reserved_hours rh inner join patients p on p.patient_id = rh.patient_id inner join users u on p.user_id = u.user_id where u.user_id = '#{current_user.user_id}' and rh.RH_STATE = true")

	@abs = AttentionBlock.find_by_sql("select * from attention_blocks")	
	@doctors = Doctor.find_by_sql("select * from doctors")
	@ests = Establishment.find_by_sql("select * from establishments")
	@comunas = Commune.find_by_sql("select * from communes")
	@specs = Specialty.find_by_sql("select * from specialties")

  end

  def mishoras2
  end

  #cancelar horas
  def cancelar
	id_hora = ReservedHour.find_by_sql("select * from reserved_hours rh where rh.RH_ID = '#{params[:id_hora]}'")
	ReservedHour.cancelar(id_hora[0].RH_ID)

	#poner mensaje de que su hora ha sido eliminada
	redirect_to welcome_index_path

  end

  def message1
  	#cancelar horas y enviar a vista message1
  	id_hora = ReservedHour.find_by_sql("select * from reserved_hours rh where rh.RH_ID = '#{params[:id_hora]}'")
	ReservedHour.cancelar(id_hora[0].RH_ID)
  end
end
