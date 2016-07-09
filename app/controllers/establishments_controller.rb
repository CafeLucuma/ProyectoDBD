class EstablishmentsController < ApplicationController
  def index
	sql = "select * from establishments order by commune_ID"
	@ests = Establishment.find_by_sql(sql)

	sql2 = "select * from communes order by commune_ID"
	@coms = Commune.find_by_sql(sql2)
  end

  def show
  end
end
