class AdministrationsController < ApplicationController
	before_filter :authenticate_user!
  	before_filter do 
    		redirect_to new_user_session_path unless current_user && current_user.admin?
  	end
  def index
  end

  def hours
	#todas las horas reservadas
	@horas = ReservedHour.find_by_sql("select * from reserved_hours where reserved_hours.RH_STATE = true")
	#todos los bloques de atención
	@abs = AttentionBlock.find_by_sql("select * from attention_blocks where AB_AVAILABLE = true")
	#los usuarios que son pacientes
	@usuarios = User.find_by_sql("select * from users u inner join patients p on p.user_id = u.user_id")
	#pacientes
	@pacientes = Patient.find_by_sql("select * from patients")
  end

  def cancelar
	ReservedHour.cancelar params[:id_hora]
	redirect_to administrations_hours_path
  end

  def selec_doctor
	@doctors = Doctor.find_by_sql("select * from doctors")
	#usuarios que son doctores
	@usuarios = User.find_by_sql("select * from users u inner join doctors d on d.user_id = u.user_id")
  end

	#seleccionar los bloques del doctor
  def block
	@bloques = AttentionBlock.find_by_sql("select * from attention_blocks ab where ab.doctor_id = '#{params[:doctor_id]}' and ab.AB_AVAILABLE = true")
	@specs = Specialty.find_by_sql("select * from specialties")
	@doc_id = params[:doctor_id]
  end

  def deshabilitar
	AttentionBlock.deshabilitar(params[:ab_id])
	redirect_to administrations_index_path
  end

  def add_block
	@doctor = User.find_by_sql("select * from users u inner join doctors d on d.user_id = u.user_id where d.doctor_id = '#{params[:doctor_id]}'")
	@specs = Specialty.find_by_sql("select * from specialties s inner join doctor_specialties ds on ds.SPEC_ID = s.SPEC_ID inner join doctors d on d.doctor_id = ds.doctor_id where d.doctor_id = '#{params[:doctor_id]}'")

  end

  def agregar_bloque
	fecha = params[:fecha]["(1i)"]+"-"+params[:fecha]["(2i)"]+"-"+params[:fecha]["(3i)"]
	hora_inicio = params[:hora_inicio]["(4i)"]+":"+params[:hora_inicio]["(5i)"]
	hora_fin = params[:hora_fin]["(4i)"]+":"+params[:hora_fin]["(5i)"]
	
	AttentionBlock.crear(params[:doctor_id], fecha, hora_inicio, hora_fin, params[:eficiencia], params[:spec_id])

	#falta mensaje que diga bloque creado
	redirect_to administrations_index_path
  end
end
