class AddNumberToEvent < ActiveRecord::Migration
  def change
    add_column :events, :reserved, :integer
    add_column :events, :attending, :integer
  end
end
