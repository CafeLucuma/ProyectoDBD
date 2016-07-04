class AddTimestampsToReservedHour < ActiveRecord::Migration
  def change
    add_column :reserved_hours, :created_at, :datetime
    add_column :reserved_hours, :updated_at, :datetime
  end
end
