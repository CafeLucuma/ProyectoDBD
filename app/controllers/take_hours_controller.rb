class TakeHoursController < ApplicationController
  def index
	@doctor = User.find_by_sql("select * from users where user_NAMES = '#{params[:nombre]}'")	

  end

  def show
	@spec = Specialty.find_by_sql("select * from specialties where SPEC_NAME = '#{params[:specialty][:SPEC_NAME]}'")	

  end

  def show2
  end

  def show3
  end
end
