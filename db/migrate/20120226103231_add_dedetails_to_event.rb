class AddDedetailsToEvent < ActiveRecord::Migration
  def change
    add_column :events, :start_date_mm, :integer
    add_column :events, :start_date_dd_, :integer
    add_column :events, :start_date_yyyy, :integer
    add_column :events, :end_date_mm, :integer
    add_column :events, :end_date_dd, :integer
    add_column :events, :end_date_yyyy, :integer
  end
end
