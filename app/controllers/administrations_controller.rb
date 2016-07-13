class AdministrationsController < ApplicationController
	before_filter :authenticate_user!
  	before_filter do 
    		redirect_to new_user_session_path unless current_user && (current_user.admin? || current_user.functionary?)
  	end
  def index
  end

  def hours
	if current_user.admin?
		#todas las horas reservadas
		@horas = ReservedHour.find_by_sql("select * from reserved_hours where reserved_hours.RH_STATE = true")
		#todos los bloques de atención
		@abs = AttentionBlock.find_by_sql("select * from attention_blocks where AB_AVAILABLE = true")
	else
		funcionario = Employee.find_by_sql("select * from employees where user_id = '#{current_user.user_id}'")
		
		#mostrar las horas del establecimiento del funcionario
		@horas = ReservedHour.find_by_sql("select * from reserved_hours rh inner join attention_blocks ab on ab.AB_ID = rh.AB_ID inner join doctors d on d.doctor_id = ab.doctor_id where d.EST_ID = '#{funcionario[0].EST_ID}' and rh.RH_STATE = true")
		@abs = AttentionBlock.find_by_sql("select * from attention_blocks ab inner join doctors d on d.doctor_id = ab.doctor_id where d.EST_ID = '#{funcionario[0].EST_ID}' and ab.AB_AVAILABLE = true")
	end
		#los usuarios que son pacientes
		@usuarios = User.find_by_sql("select * from users u inner join patients p on p.user_id = u.user_id")
		#pacientes
		@pacientes = Patient.find_by_sql("select * from patients")

  end

  def cancelar
	ReservedHour.cancelar params[:id_hora]
	#Mensaje que dice "hora eliminada"
	redirect_to administrations_message3_path
  end

  def selec_doctor
	if current_user.admin?
		@doctors = Doctor.find_by_sql("select * from doctors")
		#usuarios que son doctores
	else
		funcionario = Employee.find_by_sql("select * from employees where user_id = '#{current_user.user_id}'")
		@doctors = Doctor.find_by_sql("select * from doctors where EST_ID = '#{funcionario[0].EST_ID}'")
	end
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
	redirect_to administrations_message1_path
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

	#Mensaje que dice "bloque creado"
	redirect_to administrations_message2_path
  end

  def message1
  	#Mensaje de Bloque eliminado Exitosamente
  end

  def message2
  	#Mensaje de Bloque creado Exitosamente
  end

  def message3
  	#Mensaje de HORA eliminada Exitosamente
  end

  def permisos
  		@users = User.find_by_sql("select * from users") 
  		@ests = Establishment.find_by_sql("select * from establishments")
  		@specs = Specialty.find_by_sql("select * from specialties")
  end

end
