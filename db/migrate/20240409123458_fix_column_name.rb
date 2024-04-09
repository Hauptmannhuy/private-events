class FixColumnName < ActiveRecord::Migration[7.1]
  def change
    rename_column :events, :creator, :creator_id
  end
end
