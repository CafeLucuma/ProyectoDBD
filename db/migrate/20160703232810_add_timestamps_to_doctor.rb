class AddTimestampsToDoctor < ActiveRecord::Migration
  def change
    add_column :doctors, :created_at, :datetime
    add_column :doctors, :updated_at, :datetime
  end
end
