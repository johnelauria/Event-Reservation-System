class CreateActivityLogs < ActiveRecord::Migration
  def change
    create_table :activity_logs do |t|
      t.string :username
      t.string :activity
      t.string :details
      t.string :details2
      t.string :time

      t.timestamps
    end
  end
end
