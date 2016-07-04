class AddTimestampsToAttentionBlock < ActiveRecord::Migration
  def change
    add_column :attention_blocks, :created_at, :datetime
    add_column :attention_blocks, :updated_at, :datetime
  end
end
