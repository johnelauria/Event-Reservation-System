class AddNumberToUsers < ActiveRecord::Migration
  def change
    add_column :users, :cellnum, :integer
  end
end
