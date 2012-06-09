class AddDetailsToEvent < ActiveRecord::Migration
  def change
    add_column :events, :extended_description, :string
    add_column :events, :location_city, :string
    add_column :events, :location_street, :string
    add_column :events, :location_building, :string
    add_column :events, :start_date, :integer
    add_column :events, :start_hour, :integer
    add_column :events, :start_min, :integer
    add_column :events, :start_ti, :text
    add_column :events, :end_date, :integer
    add_column :events, :end_hour, :integer
    add_column :events, :end_min, :integer
    add_column :events, :end_ti, :text
    add_column :events, :capacity, :integer
    add_column :events, :cellnum, :integer
    add_column :events, :price, :integer
    add_column :events, :host_name, :string
  end
end
