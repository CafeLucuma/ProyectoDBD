class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	def self.crear ict, comuna, names, paterno, materno, email

		created = Time.zone.now.to_s(:db)
		updated = Time.zone.now.to_s(:db)
		sql = "INSERT INTO users (ICT_ID, communes_ID, users_NAMES, users_LASTNAME1, users_LASTNAME2, users_EMAIL, created_at, updated_at) VALUES ('#{ict}', '#{comuna}', '#{names}', '#{paterno}','#{materno}','#{email}','#{created}','#{updated}')"
		ActiveRecord::Base.connection.execute(sql)
	end

end
