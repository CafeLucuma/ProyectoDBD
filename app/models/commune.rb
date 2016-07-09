class Commune < ActiveRecord::Base
	has_many :establishments, :foreign_key => 'commune_id'
end
