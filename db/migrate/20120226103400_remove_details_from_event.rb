class RemoveDetailsFromEvent < ActiveRecord::Migration
  def up
    remove_column :events, :start_date
    remove_column :events, :end_date
  end

  def down
    add_column :events, :end_date, :integer
    add_column :events, :start_date, :integer
  end
end
