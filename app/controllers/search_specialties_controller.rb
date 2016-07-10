class SearchSpecialtiesController < ApplicationController
  def index
	@spec = Specialty.find_by_sql("select * from specialties")
  end

	def search
	@s = params.inspect
	
	end

end
