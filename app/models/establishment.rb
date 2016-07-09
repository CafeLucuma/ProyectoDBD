class Establishment < ActiveRecord::Base
	belongs_to :commune, :foreign_key => 'commune_id'
end
