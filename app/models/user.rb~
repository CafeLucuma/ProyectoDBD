class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	def self.crear ict, comuna, names, paterno, materno, email

		created = Time.zone.now.to_s(:db)
		updated = Time.zone.now.to_s(:db)
		sql = "INSERT INTO users (ICT_ID, communes_ID, user_NAMES, user_LASTNAME1, user_LASTNAME2, user_EMAIL, created_at, updated_at) VALUES ('#{ict}', '#{comuna}', '#{names}', '#{paterno}','#{materno}','#{email}','#{created}','#{updated}')"
		ActiveRecord::Base.connection.execute(sql)
	end

	def self.actualizar_cumple fecha, id
		cumple = fecha["(1i)"]+"-"+fecha["(2i)"]+"-"+fecha["(3i)"]
		sql = "UPDATE users SET user_DATE_OF_BIRTH = '#{cumple}' WHERE user_id = '#{id}'"
		ActiveRecord::Base.connection.execute(sql)
	end
end
