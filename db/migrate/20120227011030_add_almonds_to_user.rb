class AddAlmondsToUser < ActiveRecord::Migration
  def change
    add_column :users, :almonds, :integer
  end
end
