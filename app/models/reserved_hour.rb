class ReservedHour < ActiveRecord::Base

	def self.crear(paciente_id, ab_id, hora_inicio, hora_fin)
		
		hora_inicio2 = Time.parse(hora_inicio).to_s(:db)
		hora_fin2 = Time.parse(hora_fin).to_s(:db)
		created = Time.zone.now.to_s(:db)
		updated = Time.zone.now.to_s(:db)
		sql = "INSERT INTO reserved_hours (patient_id, AB_ID, RH_START_TIME, RH_FINISH_TIME, RH_STATE, RH_ASSISTANCE, RH_DERIVED, created_at, updated_at) VALUES ('#{paciente_id}', '#{ab_id}', '#{hora_inicio2}', '#{hora_fin2}', true, false, false, '#{created}','#{updated}')"
		ActiveRecord::Base.connection.execute(sql)
	end


	def self.cancelar id
	sql = "UPDATE reserved_hours SET RH_STATE = false WHERE RH_ID = '#{id}'"
	ActiveRecord::Base.connection.execute(sql)
	end

	def self.confirmarAsistencia id_hora
		sql = "UPDATE reserved_hours SET RH_ASSISTANCE = true WHERE RH_ID = '#{id_hora}'"
		ActiveRecord::Base.connection.execute(sql)
	end
end
