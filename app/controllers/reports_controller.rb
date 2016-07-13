class ReportsController < ApplicationController
  def asistenciaAPS

		@horasReservadas = ReservedHour.find_by_sql("select * from reserved_hours")
		@usuarios = User.find_by_sql("select * from users")
		@pacientes = User.find_by_sql("select * from users u inner join patients p where p.user_id = u.user_id")
		@comuna = Commune.find_by_sql("select * from communes where commune_id = '#{@usuarios[0].commune_id}'")
		@ciudad = City.find_by_sql("select * from cities where city_id = '#{@comuna[0].city_id}'")
		@pacientes_horas = User.find_by_sql("select * from users u inner join patients p on p.user_id = u.user_id inner join reserved_hours rh on rh.patient_id = p.patient_id")
		@horas_especifico = ReservedHour.find_by_sql("select * from reserved_hours hr inner join attention_blocks ab on hr.AB_ID = ab.AB_ID inner join doctors doc on doc.doctor_id = ab.doctor_id inner join establishments est on est.EST_ID = doc.EST_ID inner join establishment_attention_types eat on eat.EST_ID = est.EST_ID inner join  attention_types at on at.AT_ID = eat.AT_ID")
		@as_primaria = ReservedHour.find_by_sql("select * from reserved_hours hr inner join attention_blocks ab on hr.AB_ID = ab.AB_ID inner join doctors doc on doc.doctor_id = ab.doctor_id inner join establishments est on est.EST_ID = doc.EST_ID inner join establishment_attention_types eat on eat.EST_ID = est.EST_ID inner join  attention_types at on at.AT_ID = eat.AT_ID where at.AT_attention_types = 'Primaria'")
		@prevision = Patient.find_by_sql("select * from patients e inner join previsions p on e.prevision_id = p.prevision_id")


  		@horasAPS = Array.new
  		@horasReservadas.each do |c|
    		if c.RH_ASSISTANCE == true
    			
    			@horasAPS << c
    		end
  		end

  end

  def asistenciaGENERAL
  	@prevision = Patient.find_by_sql("select * from patients e inner join previsions p on e.prevision_id = p.prevision_id")
  	@horas_especifico = ReservedHour.find_by_sql("select * from reserved_hours hr inner join attention_blocks ab on hr.AB_ID = ab.AB_ID inner join doctors doc on doc.doctor_id = ab.doctor_id inner join establishments est on est.EST_ID = doc.EST_ID inner join establishment_attention_types eat on eat.EST_ID = est.EST_ID inner join  attention_types at on at.AT_ID = eat.AT_ID")
    @pacientes_horas = User.find_by_sql("select * from users u inner join patients p on p.user_id = u.user_id inner join reserved_hours rh on rh.patient_id = p.patient_id")


    @num_pri = 0
    @num_sec = 0
    @num_ter = 0

  end


	def solicitudes
		@prevision = Patient.find_by_sql("select * from patients e inner join previsions p on e.prevision_id = p.prevision_id")
  		@horas_especifico = ReservedHour.find_by_sql("select * from reserved_hours hr inner join attention_blocks ab on hr.AB_ID = ab.AB_ID inner join doctors doc on doc.doctor_id = ab.doctor_id inner join establishments est on est.EST_ID = doc.EST_ID inner join establishment_attention_types eat on eat.EST_ID = est.EST_ID inner join  attention_types at on at.AT_ID = eat.AT_ID")
    	@pacientes_horas = User.find_by_sql("select * from users u inner join patients p on p.user_id = u.user_id inner join reserved_hours rh on rh.patient_id = p.patient_id")

	end

	def gestion


	end

end
