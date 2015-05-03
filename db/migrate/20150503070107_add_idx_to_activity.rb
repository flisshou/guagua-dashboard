class AddIdxToActivity < ActiveRecord::Migration
  def change
    add_index :b01a2_activity,:Service_id
  end
end
