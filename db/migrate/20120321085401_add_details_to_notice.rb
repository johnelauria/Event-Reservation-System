class AddDetailsToNotice < ActiveRecord::Migration
  def change
    add_column :notices, :user_id, :integer
  end
end
